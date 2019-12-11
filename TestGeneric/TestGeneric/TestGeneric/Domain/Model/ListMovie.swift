//
//  ListMovie.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 25/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//
import Foundation

public class ListMovie {
    public let title: String
    public let artwork: String
    public let snapshot: String
    
    public init(title: String, artwork: String, snapshot: String) {
        self.title = title
        self.artwork = artwork
        self.snapshot = snapshot
    }
}

