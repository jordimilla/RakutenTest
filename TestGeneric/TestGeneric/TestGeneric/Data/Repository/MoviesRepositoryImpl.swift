//
//  MovieRepositoryImpl.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import RxCocoa
import RxSwift

class MoviesRepositoryImpl: MoviesRepository {
        
    private let moviesService: MoviesServices
    private let listMoviesTOMapper: ([ListMoviesTO]) -> [ListMovie]
    
    init(moviesService: MoviesServices,
         listMoviesTOMapper: @escaping ([ListMoviesTO]) -> [ListMovie]) {
        self.moviesService = moviesService
        self.listMoviesTOMapper = listMoviesTOMapper
    }
    
    public func getMovies() -> Single<[ListMovie]> {
        return moviesService.getMovies()
            .map{ responseTO in
                self.listMoviesTOMapper(responseTO.data)
        }
    }
    
    
}
