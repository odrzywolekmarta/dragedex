//
//  MockSeasonsViewModel.swift
//  Dragedex
//
//  Created by Majka on 30/03/2022.
//

import Foundation

class MockSeasonsViewModel: SeasonsViewModelProtocol {
    var dataSource: [SeasonModel] = []

    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getAllSeasons()
            self.dataSource = dataSource
        } catch {
            print(error)
        }
    }
}
