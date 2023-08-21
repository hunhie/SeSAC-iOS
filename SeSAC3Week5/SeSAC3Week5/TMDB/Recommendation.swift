//
//  Recommendation.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import Foundation

// MARK: - Recommendation
struct Recommendation: Codable {
    let totalPages, totalResults: Int
    let results: [Movie]
    let page: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results, page
    }
}

// MARK: - Result
struct Movie: Codable {
    let backdropPath, posterPath: String?
    let genreIDS: [Int]
    let video: Bool
    let releaseDate: String
    let originalLanguage: String
    let popularity: Double
    let title, originalTitle, overview: String
    let id, voteCount: Int
    let mediaType: MediaType
    let adult: Bool
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case video
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case popularity, title
        case originalTitle = "original_title"
        case overview, id
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case voteAverage = "vote_average"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}
