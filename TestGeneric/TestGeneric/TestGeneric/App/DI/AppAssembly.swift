//
//  AppAssembly.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class AppAssembly: Assembly {
    func assemble(container: Container) {
        // UIWindow
        container.register(UIWindow.self) { _ in
            UIWindow(frame: UIScreen.main.bounds)
            }.inObjectScope(.container)
    }
}
