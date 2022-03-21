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
    }
    
    func configureControllers() {
        let queensController = QueenDetailsViewController(nibName: String(describing: QueenDetailsViewController.self),
                                                          bundle: nil)
        let queensNavigationController = UINavigationController(rootViewController: queensController)
        
        let seasonsController = SeasonsViewController(nibName: String(describing:SeasonsViewController.self),
                                                      bundle: nil)
        let seasonsNavigationController = UINavigationController(rootViewController: seasonsController)
        viewControllers = [queensNavigationController, seasonsNavigationController]
        
    }
}
