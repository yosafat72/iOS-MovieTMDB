//
//  FetchPopularMovieUseCase.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import RxSwift

class FetchPopularMovieUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(for language: String, page: Int) -> Observable<MovieEntity> {
        return repository.fetchPopularMovie(for: language, page: page)
    }
}
