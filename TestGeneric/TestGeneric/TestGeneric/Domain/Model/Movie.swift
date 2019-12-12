//
//  Movie.swift
//  TestGeneric
//
//  Created by Jordi Milla on 12/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import Foundation

public class Movie {
    public let title: String
    public let description: String
    public let image: String
    
    public init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
}
