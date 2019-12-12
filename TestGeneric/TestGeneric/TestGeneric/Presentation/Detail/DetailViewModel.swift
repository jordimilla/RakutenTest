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

class DetailViewModel: RxViewModel {
    
    private let moviesRepository: MoviesRepository
    private let schedulerHelper: SchedulerHelper
       
    let movie = BehaviorRelay<Resource<Movie>?>(value: nil)
       
    init(moviesRepository: MoviesRepository,
            schedulerHelper: SchedulerHelper) {
        self.moviesRepository = moviesRepository
        self.schedulerHelper = schedulerHelper
    }
       
    func getDetailMovie(id: String) {
        moviesRepository.getDetailMovie(id: id)
            .subscribeOn(schedulerHelper.backgroundWorkScheduler)
            .observeOn(schedulerHelper.mainScheduler)
            .subscribe(
                onSuccess: { [weak self] (movies)  in
                    self?.movie.accept(Resource.success(movies))
                },
                onError: { [weak self] (e:Error) in
                    self?.movie.accept(Resource.failUnknown())
                }
            )
            .disposed(by: disposableBag)
       }
}
