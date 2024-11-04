//
//  HTTPHeaders.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import Foundation
import Alamofire

struct HTTPHeadersConfiguration {
    static var defaultHeaders: HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let accessToken = ProcessInfo.processInfo.environment["API_Access_Token"] ?? ""
        headers["Authorization"] = "Bearer \(accessToken)"
        
        return headers
    }
}
