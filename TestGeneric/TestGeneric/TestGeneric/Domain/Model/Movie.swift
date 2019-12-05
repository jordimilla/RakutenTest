//
//  Movie.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation

class Movie: Codable {
    let type: String
    let id: String
    let images: ImageMovie
    
    init(type:String, id: String, images: ImageMovie) {
        self.type = type
        self.id = id
        self.images = images
    }
}
