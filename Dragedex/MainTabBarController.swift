//
//  MainTabBarController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureControllers()
        configureTabBarItems()
    }
    
    func configureControllers() {
        let queensController = QueenDetailsViewController(nibName: String(describing: QueenDetailsViewController.self),
                                                          bundle: nil)
        let queensNavigationController = UINavigationController(rootViewController: queensController)
        
        let seasonsController = SeasonsViewController(nibName: String(describing:SeasonsViewController.self),
                                                      bundle: nil)
        let seasonsNavigationController = UINavigationController(rootViewController: seasonsController)
        let favouritesController = FavouritesViewController(nibName: String(describing: FavouritesViewController.self),
                                                            bundle: nil)
        let favouritesNavigationController = UINavigationController(rootViewController: favouritesController)
        
        viewControllers = [queensNavigationController, seasonsNavigationController, favouritesNavigationController]
        
    }
    
    func configureTabBarItems() {
        guard let items = tabBar.items else {
            return
        }
        for (index, tab) in AppTab.allCases.enumerated() {
            let tabItem = items[index]
            tabItem.title = tab.rawValue.capitalized
            tabItem.image = tab.image
            tabItem.tag = index
        }
    }
}
