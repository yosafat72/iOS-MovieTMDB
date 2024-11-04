//
//  MovieRepository.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import RxSwift

protocol MovieRepository {
    func fetchPopularMovie(for language: String, page: Int) -> Observable<MovieEntity>
}