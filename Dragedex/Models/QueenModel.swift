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
    
    enum ContextSpecificValue {
        case season(place: Int)
        case winnableEvent(won: Bool)
    }
    
    let id: Int
    let name: String
    let value: ContextSpecificValue?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case won
        case place
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        if let won = try? container.decode(Bool.self, forKey: .won) {
            self.value = .winnableEvent(won: won)
        } else if let place = try? container.decode(Int.self, forKey: .place) {
            self.value = .season(place: place)
        } else {
            value = nil
        }
    }
}

struct SeasonModel: Decodable {
    let id: Int
    let seasonNumber: String
    let winnerId: Int?
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
    let prize: String?
    let episodeId: Int
    let queens: [MiniQueenModel]
}

struct LipSyncModel: Decodable {
    let id: Int
    let name: String
    let artist: String
    let episodeId: Int
    let queens: [MiniQueenModel]
}
