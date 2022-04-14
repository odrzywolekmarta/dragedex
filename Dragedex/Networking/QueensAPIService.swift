//
//  QueensAPIService.swift
//  Dragedex
//
//  Created by Majka on 11/04/2022.
//

import Foundation

class QueensAPIService {
    
    private let kBaseUrl = "https://www.nokeynoshade.party/api"
    private let kQueens = "queens"
    private let kAll = "all"
    private let kEpisodes = "episodes"
    private let kChallenges = "challenges"
    private let kLipsyncs = "lipsyncs"
    private let kSeasons = "seasons"
    
    enum QueensAPIError: String, Error {
        case couldNotCreateUrl
        case unknown
    }
    
    var dataTask: URLSessionDataTask?
    
    private func getSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration)
    }
    
    func getAllQueens(completion: @escaping (Result<[QueenModel], Error>) -> Void) {
        let urlString = "\(kBaseUrl)/\(kQueens)/\(kAll)"
        guard let url = URL(string: urlString) else {
            completion(.failure(QueensAPIError.couldNotCreateUrl))
            return
        }
        let urlSession = getSession()
        dataTask = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let models = try decoder.decode([QueenModel].self, from: data)
                    completion(.success(models))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(QueensAPIError.unknown))
            }
        })
        dataTask?.resume()
    }
    
    func getQueen(forId id: Int, completion: @escaping (Result<QueenModel, Error>) -> Void) {
        let urlString = "\(kBaseUrl)/\(kQueens)/\(id)"
        guard let url = URL(string: urlString) else {
            completion(.failure(QueensAPIError.couldNotCreateUrl))
            return
        }
        let urlSession = getSession()
        dataTask = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let model = try decoder.decode(QueenModel.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(QueensAPIError.unknown))
            }
        })
        dataTask?.resume()
    }
    
    func getEpisodes(forQueenId queenId: Int, completion: (Result<[EpisodeModel], Error>) -> Void) {
        
    }
    
    func getChallenges(forQueenId queenId: Int, completion: (Result<[ChallengeModel], Error>) -> Void) {
        
    }
    
    func getLipsyncs(forQueenId queenId: Int, completion: (Result<[LipSyncModel], Error>) -> Void) {
        
    }
    
    func getEpisode(forId id: Int, completion: (Result<EpisodeModel, Error>) -> Void) {
        
    }
    
    func getAllSeasons(completion: (Result<[SeasonModel], Error>) -> Void) {
        
    }
    
    func getSeason(forId id: Int, completion: (Result<SeasonModel, Error>) -> Void) {
        
    }
    
    func getAllEpisodes(forSeasonId seasonId: Int, completion: (Result<[EpisodeModel], Error>) -> Void) {
        
    }
    
    func getChallenge(forId id: Int, completion: (Result<ChallengeModel, Error>) -> Void) {
        
    }
}
