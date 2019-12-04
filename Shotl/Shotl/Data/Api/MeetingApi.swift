//
//  Meetingpi.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya


public enum MeetingApi {
    case getMeetings
}

extension MeetingApi:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://not.in.use/")!}
    
    public var path: String {
        switch self {
        case .getMeetings:
            return "/api/v1/tracking"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getMeetings:
            return .get
        }
    }
    
    public var authorizationType: AuthorizationType {
        switch self {
        case .getMeetings:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getMeetings:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
