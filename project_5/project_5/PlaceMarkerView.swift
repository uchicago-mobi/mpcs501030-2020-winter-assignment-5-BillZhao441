//
//  PlaceMarkerView.swift
//  project_5
//
//  Created by 赵泽林 on 2/15/20.
//  Copyright © 2020 Zelin Zhao. All rights reserved.
//

import UIKit
import MapKit

class PlaceMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
      willSet {
        clusteringIdentifier = "Place"
        displayPriority = .defaultLow
        markerTintColor = .systemRed
        glyphImage = UIImage(systemName: "pin.fill")
        }
  }

}
