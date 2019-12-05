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
    var type: String!
    var id: String!
    var content_type: String!
    var name: String!

}

extension ListMoviesTO: Mappable{
    public init?(map: Map) {
    }
    
   public  mutating func mapping(map: Map) {
        type <- map["type"]
        id <- map["id"]
        content_type <- map["content_type"]
        name <- map["name"]
//        contents <- map["contents"]
    }
}
