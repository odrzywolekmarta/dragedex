//
//  AppRouter.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

protocol TabRouterProtocol {
    func pushQueenDetails(with model: QueenModel)
    func pushEpisodes(with model: QueenModel)
    func pushChallenges(with model: QueenModel)
    func pushLipsyncs(with model: QueenModel)
}

class TabRouter: TabRouterProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushQueenDetails(with model: QueenModel) {
        let viewModel = QueenDetailsViewModel(with: model)
        let queensController = QueenDetailsViewController(viewModel: viewModel,
                                                          router: self)
        navigationController.pushViewController(queensController, animated: true)
    }
    
    func pushEpisodes(with model: QueenModel) {
        let viewModel = MockEpisodesViewModel()
        let episodesController = EpisodesTableViewController(viewModel: viewModel,
                                                             router: self)
        navigationController.pushViewController(episodesController, animated: true)
    }
    
    func pushChallenges(with model: QueenModel) {
        let viewModel = MockChallengesViewModel()
        let challengesController = ChallengesTableViewController(viewModel: viewModel,
                                                                 router: self)
        navigationController.pushViewController(challengesController, animated: true)
    }
    
    func pushLipsyncs(with model: QueenModel) {
        let viewModel = MockLipsyncsViewModel()
        let lipsyncsController = LipsyncsTableViewController(viewModel: viewModel,
                                                             router: self)
        navigationController.pushViewController(lipsyncsController, animated: true)
    }
}
