//
//  DetailAssembly.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class DetailAssembly: Assembly {
    func assemble(container: Container) {
        // ViewController
        container.register(UIViewController.self, name: ScreenTag.detail) { inject in
            DetailViewController(
                router: inject.resolve(DetailRouter.self)!,
                viewModel: inject.resolve(DetailViewModel.self)!)
            }
            .inObjectScope(.weak)
        // Router
        container.register(DetailRouter.self) { inject in
           DetailRouterImpl(
                hostViewControllerProvider: inject.resolve(Provider<UIViewController>.self, name: ScreenTag.detail)!
            )
        }
        // ViewModel
        container.register(DetailViewModel.self) { inject in
            DetailViewModel(
            )
        }
    }
}
