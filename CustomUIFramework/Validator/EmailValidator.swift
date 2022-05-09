//
//  Validator.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//


import Foundation

public struct EmailValidator: Validator {
   public var invalidMessage: String? = "Please enter a valid email"
    
    public static func validate(input: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: input)
    }
}

public struct MobileValidator {
    public static func validate(input: String?,min: Int, max: Int) -> Bool {
        let mobRegEx = "^[0-9+]{0,1}+[0-9]{\(min),\(max)}$"
        let mobPred = NSPredicate(format:"SELF MATCHES %@", mobRegEx)
        return mobPred.evaluate(with: input)
    }
}

public struct UserIDValidator {
    public static func validate(input: String?,min: Int, max: Int) -> Bool {
        let userIDRegEx = "[A-Z0-9a-z]{\(min),\(max)}$"
        let userIDPred = NSPredicate(format: "SELF MATCHES %@", userIDRegEx)
        return userIDPred.evaluate(with: input)
    }
}

public struct PasswordValidator {
    public static func validate(input: String?,min: Int, max: Int) -> Bool {
        let pswdRegEx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.#?!@$%^&<>*~:`-]).{\(min),\(max)}$"
        let pswdPred = NSPredicate(format: "SELF MATCHES %@", pswdRegEx)
        return pswdPred.evaluate(with: input)
    }
}
