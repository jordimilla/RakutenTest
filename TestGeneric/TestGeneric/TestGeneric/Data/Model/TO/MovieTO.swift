//
//  MovieTO.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieTO {
    var type: String?
    var id: String?
    var images: ImageMovieTO?
}

extension MovieTO: Mappable{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        id <- map["id"]
        images <- map["images"]
    }
}

