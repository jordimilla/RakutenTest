//
//  HomeViewModel.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class HomeViewModel: RxViewModel {
    
    private let moviesRepository: MoviesRepository
    private let schedulerHelper: SchedulerHelper
    
    let movies = BehaviorRelay<Resource<[ListMovie]>?>(value: nil)
    
    init(moviesRepository: MoviesRepository,
         schedulerHelper: SchedulerHelper) {
        self.moviesRepository = moviesRepository
        self.schedulerHelper = schedulerHelper
    }
    
    func getListMovies() {
        moviesRepository.getMovies()
            .subscribeOn(schedulerHelper.backgroundWorkScheduler)
            .observeOn(schedulerHelper.mainScheduler)
            .subscribe(
                onSuccess: { [weak self] (movies)  in
                    self?.movies.accept(Resource.success(movies))
                },
                onError: { [weak self] (e:Error) in
                    self?.movies.accept(Resource.failUnknown())
                }
            )
            .disposed(by: disposableBag)
    }
}
