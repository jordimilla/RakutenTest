//
//  ListServices.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import NetworkExtension
import Moya_ObjectMapper

protocol MoviesServices {
    func getMovies() -> Single<ResponseArryTO<ListMoviesTO>>
    func getDetailMovie(id: String) -> Single<ResponseTO<MovieTO>>
}

class MoviesServicesImpl: MoviesServices {
    
    private let provider:MoyaProvider<MoviesAPI>
    
    init(provider: MoyaProvider<MoviesAPI>) {
        self.provider = provider
    }
        
    func getMovies() -> Single<ResponseArryTO<ListMoviesTO>> {
        return provider.rx.request(.getMovies)
            .mapObject(ResponseArryTO<ListMoviesTO>.self)
    }
    
    public func getDetailMovie(id: String) -> Single<ResponseTO<MovieTO>> {
        return provider.rx.request(.getDescriptionMovie(id: id))
            .mapObject(ResponseTO<MovieTO>.self)
    }
}
