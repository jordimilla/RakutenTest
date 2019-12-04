//
//  MeetingRepository.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public class MeetingRepositoryImpl: MeetingRepository {

    private let meetingService: MeetingService
    private let meetingArrayTOMapper: ([AppealTO]) -> [Appeal]
    
    public init(meetingService: MeetingService,
         meetingArrayTOMapper: @escaping ([AppealTO]) -> [Appeal]) {
        self.meetingService = meetingService
        self.meetingArrayTOMapper = meetingArrayTOMapper
    }
    
    public func getMeetings() -> Single<[Appeal]> {
        return meetingService.getMettings()
            .map{ responseTO in
                self.meetingArrayTOMapper(responseTO.meta)
        }
    }
}
