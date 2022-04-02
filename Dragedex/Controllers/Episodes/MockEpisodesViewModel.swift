//
//  MockEpisodesViewModel.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import Foundation

class MockEpisodesViewModel: EpisodesViewModelProtocol {
    var dataSource: [EpisodeModel] = []
    
    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getTestEpisodes()
            self.dataSource = dataSource
        } catch {
            print(error)
        }
    }
}
