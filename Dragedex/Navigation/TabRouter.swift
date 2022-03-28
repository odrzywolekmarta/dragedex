//
//  AppRouter.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

protocol TabRouterProtocol {
    func pushQueenDetails(with model: QueenModel)
    func pushSeasonDetails(with model: SeasonForQueenModel)
    func pushEpisodeDetails(with model: EpisodeModel)
    func pushSeasonsList()
}

class TabRouter: TabRouterProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushQueenDetails(with model: QueenModel) {
        let viewModel = QueenDetailsViewModel(with: model)
        let queensController = QueenDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(queensController, animated: true)
    }
    
    func pushSeasonDetails(with model: SeasonForQueenModel) {
    }
    
    func pushEpisodeDetails(with model: EpisodeModel) {
    }
    
    func pushSeasonsList() {
    }
    
    
}
