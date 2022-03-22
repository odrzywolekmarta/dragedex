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
            let queen = try loadJson()
            completion(Result.success(queen))
        } catch {
            completion(Result.failure(error))
        }
    }
    
    private func loadJson() throws -> QueenModel {
        guard let path = Bundle.main.url(forResource: "TestQueen", withExtension: "json") else {
            fatalError()
        }
        let data = try Data(contentsOf: path)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let model = try decoder.decode(QueenModel.self, from: jsonData)
        return model
    }
}
