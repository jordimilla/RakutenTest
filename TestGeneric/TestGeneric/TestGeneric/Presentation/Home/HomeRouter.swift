//
//  HomeRouter.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Swinject

protocol HomeRouter {
    func goDetail()
}

class HomeRouterImpl: HomeRouter {
    func goDetail() {
        let mainController = hostViewControllerProvider.instance
        let askViewController = detailViewControllerProvider.instance        
        mainController.present(askViewController, animated: true, completion: nil)
    }
    private let detailViewControllerProvider: Provider<UIViewController>
    private let hostViewControllerProvider: Provider<UIViewController>
    init(hostViewControllerProvider: Provider<UIViewController>,
         detailViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
        self.detailViewControllerProvider = detailViewControllerProvider
    }
}
