//
//  MovieEntity.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import SwiftyJSON

struct MovieEntity {
    let page: Int
    let results: [Result]
    let totalPages: Int
    let totalResults: Int
}

// MARK: - Result
struct Result {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

enum OriginalLanguage: String {
    case en = "en"
    case fr = "fr"
    case tl = "tl"
}
