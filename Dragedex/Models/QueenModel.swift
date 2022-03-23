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
    let seasons: [SeasonModel]?
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

struct SeasonModel: Decodable {
    let seasonNumber: String
    let id: Int
    let place: Int
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
