//
//  UI.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import Foundation

protocol Nibable {
    static func instantateFromNib() -> BaseViewController
}

struct Assets {
    struct Keys {
        static var Bell = "bell"
        static var Logout = "logout"
        static var Cart = "cart"
    }
}
