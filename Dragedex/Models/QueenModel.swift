//
//  QueenModel.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import Foundation

struct QueenModel: Decodable {
    let id: Int
    let name: String
    let winner: Bool
    let missCongeniality: Bool
    let quote: String
    let imageUrl: String?
    let seasons: [SeasonForQueenModel]?
    let episodes: [EpisodeModel]?
    let challenges: [ChallengeModel]?
    let lipsyncs: [LipSyncModel]?
    var seasonsDescription: String? {
        guard let seasonNumbers = seasons?.map ({
            $0.seasonNumber
        }) .joined(separator: ", ") else {
            return nil
        }
        let seasonsText = "Seasons: \(seasonNumbers)"
        return seasonsText
    }
}

struct SeasonForQueenModel: Decodable {
    let seasonNumber: String
    let id: Int
    let place: Int
}

struct MiniQueenModel: Decodable {
    
    enum ContextSpecificValue: Decodable {
        
        private enum CodingKeys: String, CodingKey {
            case place
            case won
        }
        
        enum ContextSpecificValueError: Error {
            case couldNotParse
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            if let value = try? values.decode(Int.self, forKey: .place) {
                self = .season(place: value)
                return
            } else if let value = try? values.decode(Bool.self, forKey: .won) {
                self = .winnableEvent(won: value)
                return
            } else {
                throw ContextSpecificValueError.couldNotParse
            }
        }
        
        case season(place: Int)
        case winnableEvent(won: Bool)
    }
    
    let id: Int
    let name: String
    let value: ContextSpecificValue
}

struct SeasonModel: Decodable {
    let id: Int
    let seasonNumber: String
    let winnerId: Int
    let imageUrl: String
    let queens: [MiniQueenModel]
    
}

struct EpisodeModel: Decodable {
    let id: Int
    let seasonId: Int
    let episodeInSeason: Int
    let title: String
    let airDate: String
}

struct ChallengeModel: Decodable {
    enum ChallengeType: String, Decodable {
        case mini
        case main
    }
    
    let id: Int
    let type: ChallengeType
    let description: String
    let won: Bool
}

struct LipSyncModel: Decodable {
    let id: Int
    let won: Bool
    let name: String
    let artist: String
}
