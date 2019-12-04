//
//  MeetingService.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import NetworkExtension
import Moya_ObjectMapper

public protocol MeetingService {
    func getMettings()-> Single<ResponseArryTO<AppealTO>>
}

public class MeetingServiceImpl: MeetingService {

    private let provider:MoyaProvider<MeetingApi>
    
    public init(provider: MoyaProvider<MeetingApi>) {
        self.provider = provider
    }
    
    public func getMettings() -> Single<ResponseArryTO<AppealTO>> {
        return provider.rx.request(.getMeetings)
            .mapObject(ResponseArryTO<AppealTO>.self)
    }
}
