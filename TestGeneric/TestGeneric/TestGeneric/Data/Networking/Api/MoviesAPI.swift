//
//  Movies.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya


enum MoviesAPI {
    case getMovies
    case getDescriptionMovie(id: String)
}

extension MoviesAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://gizmo.rakuten.tv/")!}
    
    public var path: String {
        switch self {
        case .getMovies:
            return "v3/lists/estrenos-imprescindibles-en-taquilla?classification_id=6&device_identifier=ios&locale=es&market_code=es"
        case .getDescriptionMovie(let id):
            return "v3/movies/\(id)?classification_id=6&device_identifier=ios&"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies, .getDescriptionMovie:
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getMovies, .getDescriptionMovie:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getMovies:
            return .requestPlain
        case .getDescriptionMovie:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
