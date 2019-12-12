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
    private let movieTOMapper: (MovieTO) -> Movie
    
    init(moviesService: MoviesServices,
         listMoviesTOMapper: @escaping ([ListMoviesTO]) -> [ListMovie],
         movieTOMapper: @escaping (MovieTO) -> Movie) {
        self.moviesService = moviesService
        self.listMoviesTOMapper = listMoviesTOMapper
        self.movieTOMapper = movieTOMapper
    }
    
    public func getMovies() -> Single<[ListMovie]> {
        return moviesService.getMovies()
            .map{ responseTO in
                self.listMoviesTOMapper(responseTO.data)
        }
    }
    
    public func getDetailMovie(id: String) -> Single<Movie> {
        return moviesService.getDetailMovie(id: id)
            .map{ responseTO in self.movieTOMapper(responseTO.data)
        }
    }
    
}
