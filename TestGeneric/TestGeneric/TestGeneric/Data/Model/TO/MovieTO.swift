//
//  MovieTO.swift
//  TestGeneric
//
//  Created by Jordi Milla on 12/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MovieTO {
    var title: String!
    var description: String!
    var image: String!
}

extension MovieTO: Mappable{
    public init?(map: Map) {
    }
    
   public  mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["short_plot"]
        image <- map["images.artwork"]

    }
}
