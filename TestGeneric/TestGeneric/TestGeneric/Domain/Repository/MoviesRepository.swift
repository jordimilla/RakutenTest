//
//  MoviesRepository.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol MoviesRepository {
    func getMovies() -> Single<[ListMovie]>
}

