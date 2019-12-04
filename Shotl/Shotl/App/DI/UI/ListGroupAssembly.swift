//
//  ListGroupAssembly.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Swinject

class MeetingGroupAssembly: Assembly {
    
    func assemble(container: Container) {
           // ViewController
           container.register(UIViewController.self,name: ScreenTag.listGroup) { r in
               MeetingGroupViewController(
                   router: r.resolve(MeetingGroupRouter.self)!,
                   viewModel: r.resolve(MeetingGroupViewModel.self)!
               )
           }.inObjectScope(.weak)
           
           // Router
           container.register(MeetingGroupRouter.self) { r in
               MeetingGroupRouterImpl(
                   hostViewControllerProvider: r.resolve(Provider<UIViewController>.self,name: ScreenTag.listGroup)!
               )
           }
           
           // ViewModel
           container.register(MeetingGroupViewModel.self) { r in
               MeetingGroupViewModel(
//                meetingRepository: r.resolve(MeetingRepository.self)!,
//                schedulerHelper: r.resolve(SchedulerHelper.self)!

               )
           }
       }
}
