//
//  RepositoryAssembly.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MeetingRepository.self) {  r in
            MeetingRepositoryImpl(
                meetingService: r.resolve(MeetingService.self)!,
                meetingArrayTOMapper: meetingArrayTOMapper)
            }.inObjectScope(.weak)
    }
}

