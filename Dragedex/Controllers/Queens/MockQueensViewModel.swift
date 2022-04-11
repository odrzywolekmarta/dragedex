//
//  MockQueensViewModel.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import Foundation

class MockQueensViewModel: QueensViewModelProtocol {
    var delegate: QueensViewModelDelegate?
    
    var dataSource: [QueenModel] = []
    
    func updateDataSource() {
        let provider = MockDataProvider()
        do {
            let dataSource = try provider.getAllQueens()
            self.dataSource = dataSource
        } catch {
            print(error)
        }
    }
}
