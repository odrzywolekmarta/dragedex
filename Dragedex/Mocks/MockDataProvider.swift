//
//  MockDataProvider.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import Foundation

struct MockDataProvider {
    private func loadJsonDictionary(name: String) throws -> Data {
        guard let path = Bundle.main.url(forResource: name, withExtension: "json") else {
            fatalError()
        }
        let data = try Data(contentsOf: path)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
        return jsonData
    }
    
    private func loadJsonDictionaryArray(name: String) throws -> Data {
        guard let path = Bundle.main.url(forResource: name, withExtension: "json") else {
            fatalError()
        }
        let data = try Data(contentsOf: path)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
        return jsonData
    }
    
    func getSampleQueen() throws -> QueenModel {
        let jsonData = try loadJsonDictionary(name: "TestQueen")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(QueenModel.self, from: jsonData)
    }
    
    func getAllQueens() throws -> [QueenModel] {
        let jsonData = try loadJsonDictionaryArray(name: "TestAllQueens")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([QueenModel].self, from: jsonData)
    }
    
    func getAllSeasons() throws -> [SeasonModel] {
        let jsonData = try loadJsonDictionaryArray(name: "TestAllSeasons")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([SeasonModel].self, from: jsonData)
    }
    
    func getTestEpisodes() throws -> [EpisodeModel] {
        let jsonData = try loadJsonDictionaryArray(name: "TestEpisodes")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([EpisodeModel].self, from: jsonData)
    }
    
    func getTestChallenges() throws -> [ChallengeModel] {
        let jsonData = try loadJsonDictionaryArray(name: "TestChallenges")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([ChallengeModel].self, from: jsonData)
    }
    
    func getTestLipsyncs() throws -> [LipSyncModel] {
        let jsonData = try loadJsonDictionaryArray(name: "TestLipsyncs")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([LipSyncModel].self, from: jsonData)
    }
}
