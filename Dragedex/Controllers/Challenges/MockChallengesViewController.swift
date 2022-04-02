//
//  MockChallengesViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import Foundation

class MockChallengesViewModel: ChallengesViewModelProtocol {
    var dataSource: [ChallengeModel] = []
    
    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getTestChallenges()
            self.dataSource = dataSource
        } catch {
            print(error)
        }
    }
}
