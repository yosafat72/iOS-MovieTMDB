//
//  WeatherServiceImpl.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class MovieServiceImpl: MovieService {
    
    func fetchPopularMovie(for language: String, page: Int) -> Observable<MovieEntity> {
        return Observable.create { observer in
            
            let parameters: [String: Any] = [
                "language": language,
                "page": page
            ]
            
            let request = AF.request(APIConstants.BASE_URL + APIConstants.MOVIE_POPULAR, parameters: parameters, headers: HTTPHeadersConfiguration.defaultHeaders).responseData { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let movie = MovieMapper.map(from: json){
                        observer.onNext(movie)
                        observer.onCompleted()
                    }else{
                        observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Parsing error"]))
                    }
                case .failure(let error):
                    observer.onError(error)
                }
                
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
}
