//
//  MapViewController.swift
//  project_5
//
//  Created by 赵泽林 on 2/14/20.
//  Copyright © 2020 Zelin Zhao. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var top: UIView!
    @IBOutlet weak var bottom: UIView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topSubtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.mapView.register(PlaceMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x:110, y:30, width:200, height:50)
        button.setTitle("Favorites", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.addTarget(self, action:#selector(MapViewController.buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        bottom.addSubview(button)
        
        let buttonStar = UIButton(type: .system)
        buttonStar.frame = CGRect(x:320, y:15, width:30, height:30)
        buttonStar.setImage(UIImage(systemName: "star.fill"), for: .selected)
        buttonStar.setImage(UIImage(systemName: "star"), for: .normal)
        buttonStar.addTarget(self, action: #selector(buttonAction(button:)),for:.touchUpInside)
        top.addSubview(buttonStar)

        let diaryList:String = Bundle.main.path(forResource: "Data", ofType:"plist")!
        let data:NSDictionary = NSDictionary(contentsOfFile:diaryList)!
        let dataArray:NSArray = data.object(forKey: "places") as! NSArray
        for i in 0...12 {
            let diaries:NSDictionary = dataArray[i] as! NSDictionary
            let name:NSString = diaries.object(forKey: "name") as! NSString
            let description:NSString = diaries.object(forKey: "description") as! NSString
            let lat:Double = diaries.object(forKey: "lat") as! Double
            let long:Double = diaries.object(forKey: "long") as! Double
            let location = CLLocationCoordinate2DMake(lat, long)
            let place = Place(__coordinate: location)
            place.title = name as String
            place.subtitle = description as String
            mapView.addAnnotation(place)
        }
        let diaries:NSDictionary = dataArray[0] as! NSDictionary
        let hhh:NSString = diaries.object(forKey: "name") as! NSString
        print("hhh=\(hhh)")
        
        mapView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let miles: Double = 500
        //set a center point
        let zoomLocation = CLLocationCoordinate2DMake(41.948287, -87.655697)
        //create the region we want to see
        let viewRegion = MKCoordinateRegion(center: zoomLocation, latitudinalMeters: miles, longitudinalMeters: miles)
        //set the region on the map
        mapView.setRegion(viewRegion, animated: true)
        mapView.showsCompass = false
        mapView.pointOfInterestFilter = .excludingAll
    }
    
    @objc func buttonTapped(_ button: UIButton) {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Favorites View Controller")
        self.present(vc, animated: true, completion: nil)
    }

    @objc func buttonAction(button : UIButton) {
        button.isSelected = !button.isSelected
        if button.isSelected {
            DataManager.sharedInstance.saveFavorites(title: topTitle.text!)
        } else {
            DataManager.sharedInstance.deleteFavorite(title: topTitle.text!)
        }
    }
    

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            topTitle.text = (view.annotation?.title)!
            topSubtitle.text = (view.annotation?.subtitle)!

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

