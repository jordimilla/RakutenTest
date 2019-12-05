//
//  ListMovie.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//
import Foundation

public class ListMovie {
    public let type: String
    public let id: String
    public let content_type: String
    public let name: String
    
   public init(type: String,
         id: String,
        content_type: String,
        name: String) {
        self.type = type
        self.id = id
        self.content_type = content_type
        self.name = name
    }
}

