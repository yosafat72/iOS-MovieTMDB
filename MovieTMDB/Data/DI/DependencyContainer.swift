//
//  DependencyContainer.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import Swinject

class DependencyContainer {
    static let shared = DependencyContainer()
    private let container = Container()
    
    private init(){
        //MARK: Register remote data sources
        container.register(MovieService.self) { _ in MovieServiceImpl()}
        
        //MARK: Register repositories
        container.register(MovieRepository.self) { resolver in
            let remoteDataSource = resolver.resolve(MovieService.self)!
            return MovieRepositoryImpl(movieService: remoteDataSource)
        }
        
        //MARK: Register usecases
        container.register(FetchPopularMovieUseCase.self) { resolver in
            let repository = resolver.resolve(MovieRepository.self)!
            return FetchPopularMovieUseCase(repository: repository)
        }
        
        //MARK: Register view models
        container.register(HomeViewModel.self) { resolver in
            let fetchPopularMovieUseCase = resolver.resolve(FetchPopularMovieUseCase.self)!
            return HomeViewModel(fetchPopularMovieUseCase: fetchPopularMovieUseCase)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
