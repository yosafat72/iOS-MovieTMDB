//
//  MovieMapper.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import SwiftyJSON

class MovieMapper {
    
    // MARK: - Mapping Errors
    enum MappingError: Error {
        case invalidData
    }
    
    // MARK: - Static Method to Map JSON to MovieEntity
    static func map(from json: JSON) -> MovieEntity? {
        do {
            guard let page = json["page"].int,
                  let totalPages = json["total_pages"].int,
                  let totalResults = json["total_results"].int else {
                throw MappingError.invalidData
            }
            
            let results = json["results"].arrayValue.compactMap { resultJson -> Result? in
                return mapResult(resultJson: resultJson)
            }
            
            return MovieEntity(page: page, results: results, totalPages: totalPages, totalResults: totalResults)
        } catch {
            print("Mapping error: \(error)")
            return nil
        }
    }
    
    // MARK: - Private Static Method to Map JSON to Result
    private static func mapResult(resultJson: JSON) -> Result? {
        guard let adult = resultJson["adult"].bool,
              let backdropPath = resultJson["backdrop_path"].string,
              let genreIDS = resultJson["genre_ids"].arrayObject as? [Int],
              let id = resultJson["id"].int,
              let originalLanguageRaw = resultJson["original_language"].string,
              let originalLanguage = OriginalLanguage(rawValue: originalLanguageRaw),
              let originalTitle = resultJson["original_title"].string,
              let overview = resultJson["overview"].string,
              let popularity = resultJson["popularity"].double,
              let posterPath = resultJson["poster_path"].string,
              let releaseDate = resultJson["release_date"].string,
              let title = resultJson["title"].string,
              let video = resultJson["video"].bool,
              let voteAverage = resultJson["vote_average"].double,
              let voteCount = resultJson["vote_count"].int else {
            return nil
        }
        
        return Result(adult: adult,
                      backdropPath: backdropPath,
                      genreIDS: genreIDS,
                      id: id,
                      originalLanguage: originalLanguage,
                      originalTitle: originalTitle,
                      overview: overview,
                      popularity: popularity,
                      posterPath: posterPath,
                      releaseDate: releaseDate,
                      title: title,
                      video: video,
                      voteAverage: voteAverage,
                      voteCount: voteCount)
    }
}
