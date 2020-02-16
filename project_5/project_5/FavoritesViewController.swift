//
//  FavoritesViewController.swift
//  project_5
//
//  Created by 赵泽林 on 2/15/20.
//  Copyright © 2020 Zelin Zhao. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let data: [String] = DataManager.sharedInstance.listFavorites()

    @IBOutlet weak var fontTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        /// 先添加tableview绑定到ViewController里，然后在ViewDidload里调用网络链接获取到网络数据，然后保存到一个类数组里，然后再加载完数据后调用绑定的
        ///
        /// - Parameters:
        ///   - tableView:
        ///   - indexPath:
        /// - Returns:
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = fontTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) 
            let text = data[indexPath.row]
    //        print(text)
            
            cell.textLabel?.text = text
    //        cell.textLabel?.textColor = UIColor.black
            
            return cell
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
