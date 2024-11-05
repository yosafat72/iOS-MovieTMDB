//
//  APIConstants.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation

struct APIConstants {
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let ACCESS_TOKEN = ProcessInfo.processInfo.environment["API_Access_Token"]
    static let SECURE_BASE_URL_IMAGE_PATH = "https://image.tmdb.org/t/p/w780"
    
    static let MOVIE_POPULAR = "movie/popular"
}
