//
//  DataManager.swift
//  project_5
//
//  Created by 赵泽林 on 2/15/20.
//  Copyright © 2020 Zelin Zhao. All rights reserved.
//

import Foundation
public class DataManager {
  
  // MARK: - Singleton Stuff
  public static let sharedInstance = DataManager()
    let defaults = UserDefaults.standard
    var data = [String]()
  
  //This prevents others from using the default '()' initializer
  fileprivate init() {}

  // Your code (these are just example functions, implement what you need)
  func loadAnnotationFromPlist() {}
  func saveFavorites(title: String) {
      defaults.set(title, forKey: title)
    }
  func deleteFavorite(title: String) {
    defaults.removeObject(forKey: title)
    }
    func listFavorites() -> [String] {
    return data
    }

}
