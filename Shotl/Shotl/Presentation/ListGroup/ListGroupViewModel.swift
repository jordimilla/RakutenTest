//
//  ListGroupViewModel.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class ListGroupViewModel: RxViewModel{
    
    private let meetingRepository: MeetingRepository
    private let schedulerHelper: SchedulerHelper
    
    public init(meetingRepository: MeetingRepository,
         schedulerHelper: SchedulerHelper) {
        self.meetingRepository = meetingRepository
        self.schedulerHelper = schedulerHelper
    }
    

}
