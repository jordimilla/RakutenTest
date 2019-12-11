//
//  ListMoviesTO.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ListMoviesTO {
    var title: String!
    var artwork: String!
    var snapshot: String!
}

extension ListMoviesTO: Mappable{
    public init?(map: Map) {
    }
    
   public  mutating func mapping(map: Map) {
        title <- map["title"]
        artwork <- map["images.artwork"]
        snapshot <- map["images.snapshot"]

    }
}
