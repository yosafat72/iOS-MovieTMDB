//
//  MovieRepositoryImpl.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import RxSwift

class MovieRepositoryImpl: MovieRepository {
    
    private let movieService: MovieService
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func fetchPopularMovie(for language: String, page: Int) -> Observable<MovieEntity> {
        return movieService.fetchPopularMovie(for: language, page: page)
    }
    
    
}
