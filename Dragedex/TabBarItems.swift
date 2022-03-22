//
//  tabBarItems.swift
//  Dragedex
//
//  Created by Majka on 22/03/2022.
//

import Foundation
import UIKit

//let queensImage = UIImage(systemName: "folder")
//let seasonsImage = UIImage(systemName: "folder.fill")
//let favouritesImage = UIImage(systemName: "folder")
//
//let queensItem = UITabBarItem(title: "Queens", image: queensImage, tag: 0)
//let seasonsItem = UITabBarItem(title: "Seasons", image: seasonsImage, tag: 1)
//let favouritesItem = UITabBarItem(title: "Favourites", image: favouritesImage, tag: 2)

enum AppTab: String, CaseIterable {
    case queens
    case seasons
    case favourites
    
    var imageName: String {
        switch self {
        case .queens, .favourites:
            return "folder"
        case .seasons:
            return "folder.fill"
        }
    }
    
    var image: UIImage? {
        UIImage(systemName: imageName)
    }
}
