//
//  Color.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 29/4/22.
//

import Foundation
import UIKit

public extension UIColor {
    
   struct StandardColor {
        static let PrimaryBlue = UIColor(hex: "336FA3")
        static let DarkBlue = UIColor(hex: "152C73")
        static let Blue = UIColor(hex: "5199C6")
        static let Green = UIColor(hex: "99C355")
        static let Red = UIColor(hex: "CE0000")
        static let DarkGray = UIColor(hex: "404040")
        static let LightGray = UIColor(hex: "AFAFAF")
        static let VeryLightGray = UIColor(hex: "F7F7F7")
        static let ButtonGray = UIColor(hex: "68666A")
        static let Brown = UIColor(hex: "3C3A44")
        static let Black = UIColor(hex: "000000")
        static let White = UIColor(hex: "FFFFFF")
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        var color: UInt64 = 0
        
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
