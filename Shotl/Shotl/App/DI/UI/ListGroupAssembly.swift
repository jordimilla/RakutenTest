//
//  ListGroupAssembly.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Swinject

class ListGroupAssembly: Assembly {
    
    func assemble(container: Container) {
           // ViewController
           container.register(UIViewController.self,name: ScreenTag.listGroup) { r in
               ListGroupViewController(
                   router: r.resolve(ListGroupRouter.self)!,
                   viewModel: r.resolve(ListGroupViewModel.self)!
               )
           }.inObjectScope(.weak)
           
           // Router
           container.register(ListGroupRouter.self) { r in
               ListGroupRouterImpl(
                   hostViewControllerProvider: r.resolve(Provider<UIViewController>.self,name: ScreenTag.listGroup)!
               )
           }
           
           // ViewModel
           container.register(ListGroupViewModel.self) { r in
               ListGroupViewModel(
//                meetingRepository: r.resolve(MeetingRepository.self)!,
//                schedulerHelper: r.resolve(SchedulerHelper.self)!

               )
           }
       }
}
