//
//  HomeRouter.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol DetailRouter {
    func goHome()
}

class DetailRouterImpl: DetailRouter {
    func goHome() {
    }
    private let hostViewControllerProvider: Provider<UIViewController>
    init(hostViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
}
