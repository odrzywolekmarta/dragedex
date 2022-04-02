//
//  MockLipsyncsViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import Foundation

class MockLipsyncsViewModel: LipsyncsViewModelProtocol {
    var dataSource: [LipSyncModel] = []
    
    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getTestLipsyncs()
            self.dataSource = dataSource
        } catch {
            print(error)
        }
    }
}
