//
//  MockQueenDetailsViewModel.swift
//  Dragedex
//
//  Created by Majka on 22/03/2022.
//

import Foundation

class MockQueenDetailsViewModel: QueenDetailsViewModelProtocol {
    func getQueen(completion: (Result<QueenModel, Error>) -> Void) {
        do {
            let provider = MockDataProvider()
            let queen = try provider.getSampleQueen()
            completion(Result.success(queen))
        } catch {
            completion(Result.failure(error))
        }
    }
}
