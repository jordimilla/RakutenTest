//
//  ListMovie.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//
import Foundation

public class ListMovie {
    public let id: String
    public let title: String
    public let artwork: String
    public let snapshot: String
    
    public init(id: String, title: String, artwork: String, snapshot: String) {
        self.id = id
        self.title = title
        self.artwork = artwork
        self.snapshot = snapshot
    }
}

