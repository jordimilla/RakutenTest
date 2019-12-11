//
//  MovieMapper.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation

public func listMoviesTOMapper(value: [ListMoviesTO]) -> [ListMovie] {
    
    return value.map { countK -> ListMovie in
        return ListMovie(title: countK.title, artwork: countK.artwork, snapshot: countK.snapshot )
    }
}
