//
//  MockSeasonsViewModel.swift
//  Dragedex
//
//  Created by Majka on 30/03/2022.
//

import Foundation

class MockSeasonsViewModel: SeasonsViewModelProtocol {
    var dataSource: [SeasonSection] = []

    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getAllSeasons()
            let firstSectionDataSource = dataSource
                .filter {
                    $0.seasonNumber.contains("A")
                }.sorted {
                    $0.seasonNumber < $1.seasonNumber
                }
            let firstSection = SeasonSection(title: "All Stars", array: firstSectionDataSource)
            let secondSectionDataSource = dataSource
                .filter {
                    !$0.seasonNumber.contains("A")
                }.sorted {
                    Int($0.seasonNumber) ?? 0 < Int($1.seasonNumber) ?? 0
                }
            let secondSection = SeasonSection(title: "Regular Seasons", array: secondSectionDataSource)
            self.dataSource = [firstSection, secondSection]
        } catch {
            print(error)
        }
    }
}
