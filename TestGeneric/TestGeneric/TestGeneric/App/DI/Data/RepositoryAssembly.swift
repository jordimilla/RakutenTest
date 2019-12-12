//
//  RepositoryAssembly.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(MoviesRepository.self) {  r in
            MoviesRepositoryImpl(
                moviesService: r.resolve(MoviesServices.self)!,
                listMoviesTOMapper: listMoviesTOMapper,
                movieTOMapper: movieTOMapper)
            }.inObjectScope(.weak)
    }
}
