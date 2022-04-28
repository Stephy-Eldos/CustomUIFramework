//
//  Validator.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

public protocol Validator {
    static func validate(input: String?) -> Bool
    var invalidMessage: String? { get }
}
