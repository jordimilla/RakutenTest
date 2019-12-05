//
//  Colors.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Hue

public enum Palette: String {
    //Primary
    case black = "212121"
    case yellow = "fce24c"
    case white = "ffffff"
}

extension UIColor {
    public class func color(_ palette: Palette) -> UIColor {
        return UIColor(hex: palette.rawValue)
    }
}
