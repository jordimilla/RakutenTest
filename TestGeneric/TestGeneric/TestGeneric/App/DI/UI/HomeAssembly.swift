//
//  HomeAssembly.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        // ViewController
        container.register(UIViewController.self, name: ScreenTag.home) { inject in
            HomeViewController(
                router: inject.resolve(HomeRouter.self)!,
                viewModel: inject.resolve(HomeViewModel.self)!)
            }
            .inObjectScope(.weak)
        // Router
        container.register(HomeRouter.self) { inject in
            HomeRouterImpl(
                hostViewControllerProvider: inject.resolve(Provider<UIViewController>.self, name: ScreenTag.home)!,
                detailViewControllerProvider: inject.resolve(Provider<UIViewController>.self, name: ScreenTag.detail)!
            )
        }
        // ViewModel
        container.register(HomeViewModel.self) { inject in
            HomeViewModel(
                moviesRepository: inject.resolve(MoviesRepository.self)!,
                schedulerHelper: inject.resolve(SchedulerHelper.self)!
            )
        }
    }
}
