//
//  ImageMovieTO.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImageMovieTO {
    var artwork: String?
    var snapshot: String?
}

extension ImageMovieTO: Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        artwork <- map["artwork"]
        snapshot <- map["snapshot"]
    }
}
