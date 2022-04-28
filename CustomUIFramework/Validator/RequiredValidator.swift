//
//  RequiredValidator.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

public struct RequiredValidator: Validator {
    public var invalidMessage: String? = "*"
    
    public static func validate(input: String?) -> Bool {
        return input?.count ?? 0 > 0
    }
}
