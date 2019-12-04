//
//  MeetingRepository.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public protocol MeetingRepository {
    
    func getMeetings() -> Single<[Meeting]>
}
