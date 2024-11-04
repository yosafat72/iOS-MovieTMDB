//
//  HomeViewModel.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private let fetchPopularMovieUseCase: FetchPopularMovieUseCase
    private let disposeBag = DisposeBag()
    
    let movieData = PublishSubject<MovieEntity>()
    let errorMessage = PublishSubject<String>()
    
    init(fetchPopularMovieUseCase: FetchPopularMovieUseCase) {
        self.fetchPopularMovieUseCase = fetchPopularMovieUseCase
    }
    
    func getPopularMovie(for language: String, page: Int){
        fetchPopularMovieUseCase.execute(for: language, page: page)
            .subscribe(onNext: {[weak self] movie in
                let data = movie
                self?.movieData.onNext(data)
            }, onError: {[weak self] error in
                self?.errorMessage.onNext("Failed to get popular movie: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
    
}
