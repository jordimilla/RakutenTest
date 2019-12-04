//
//  ListGroupRouter.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Swinject

public protocol ListGroupRouter {
}

public class ListGroupRouterImpl: ListGroupRouter {
    private let hostViewControllerProvider: Provider<UIViewController>
    
    public init( hostViewControllerProvider: Provider<UIViewController> ) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }

}
