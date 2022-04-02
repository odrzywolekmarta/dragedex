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
        let queensViewModel = MockQueensViewModel()
        let queensNavigationController = UINavigationController()
        let queensTabRouter = TabRouter(navigationController: queensNavigationController)
        let queensController = QueensTableViewController(viewModel: queensViewModel, router: queensTabRouter)
        queensNavigationController.setViewControllers([queensController], animated: false)
        
        let seasonsViewModel = MockSeasonsViewModel()
        let seasonsNavigationController = UINavigationController()
        let seasonsTabRouter = TabRouter(navigationController: seasonsNavigationController)
        let seasonsController = SeasonsTableViewController(viewModel: seasonsViewModel,
                                                           router: seasonsTabRouter)
        seasonsNavigationController.setViewControllers([seasonsController], animated: false)
        
        let lipsyncViewModel = MockLipsyncsViewModel()
        let lipsyncsNavigationController = UINavigationController()
        let lipsyncsTabRouter = TabRouter(navigationController: lipsyncsNavigationController)
        let lipsyncsController = LipsyncsTableViewController(viewModel: lipsyncViewModel, router: lipsyncsTabRouter)
        lipsyncsNavigationController.setViewControllers([lipsyncsController], animated: false)
        
        let episodesViewModel = MockEpisodesViewModel()
        let episodesNavigationcontroller = UINavigationController()
        let episodesTabRouter = TabRouter(navigationController: episodesNavigationcontroller)
        let episodesController = EpisodesTableViewController(viewModel: episodesViewModel, router: episodesTabRouter)
        episodesNavigationcontroller.setViewControllers([episodesController], animated: false)
        
        let challengesViewModel = MockChallengesViewModel()
        let challengesNavigationController = UINavigationController()
        let challengesTabRouter = TabRouter(navigationController: challengesNavigationController)
        let challengesController = ChallengesTableViewController(viewModel: challengesViewModel, router: challengesTabRouter)
        challengesNavigationController.setViewControllers([challengesController], animated: false)
        
        viewControllers = [queensNavigationController,
                           seasonsNavigationController,
                           lipsyncsNavigationController,
                           episodesNavigationcontroller,
                           challengesNavigationController]
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
