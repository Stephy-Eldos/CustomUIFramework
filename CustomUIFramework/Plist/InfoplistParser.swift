//
//  InfoplistParser.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 5/5/22.
//

import Foundation

public protocol InfolistParser {
    static func getStringValue(key: String, styleNo: String) -> String
    static func getIntValue(key: String, styleNo: String) -> Int
}

