//
//  AppRouter.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

protocol TabRouterProtocol {
    func pushQueenDetails(with model: QueenModel)
    func pushSeasonDetails(with model: SeasonModel)
    func pushEpisodeDetails(with model: EpisodeModel)
    func pushSeasonsList()
}

class TabRouter: TabRouterProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushQueenDetails(with model: QueenModel) {
        do {
            let viewModel = QueenDetailsViewModel(with: model)
            let queensController = QueenDetailsViewController(nibName: String(describing: QueenDetailsViewController.self),
                                                              bundle: nil)
            queensController.viewModel = viewModel
            navigationController.pushViewController(queensController, animated: true)
        } catch {
            print(error)
            fatalError()
        }

    }
    
    func pushSeasonDetails(with model: SeasonModel) {
    }
    
    func pushEpisodeDetails(with model: EpisodeModel) {
    }
    
    func pushSeasonsList() {
    }
    
    
}
