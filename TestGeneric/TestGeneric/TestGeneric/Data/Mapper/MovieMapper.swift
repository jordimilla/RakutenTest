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
        return ListMovie(type: countK.type,
                         id: countK.id,
                         content_type: countK.content_type,
                         name: countK.name)
    }
}
