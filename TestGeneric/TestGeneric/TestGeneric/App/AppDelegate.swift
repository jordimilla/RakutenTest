//
//  AppDelegate.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let assembler = Assembler([
        // UI
        HelperAssembly(),
        AppAssembly(),
        HomeAssembly(),
        DetailAssembly(),
        
        // Data
        RepositoryAssembly(),
        NetworkingAssembly()
    ])
    private func setUpUIWindow() {
        window = assembler.resolver.resolve(UIWindow.self)
        let navigationController = UINavigationController(rootViewController: assembler.resolver.resolve(UIViewController.self, name: ScreenTag.home)!)
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpUIWindow()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
