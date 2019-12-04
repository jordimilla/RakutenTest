//
//  AppAssembly.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Swinject

class AppAssembly: Assembly {

    func assemble(container: Container) {
        // UIWindow
        container.register(UIWindow.self) { _ in
            UIWindow(frame: UIScreen.main.bounds)
        }.inObjectScope(.container)
    }
}
