//
//  UnderlinedButton.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class TextButton: UIButton {
        
        public init() {
            super.init(frame: CGRect.zero)
        }
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }
        
        required public init?(coder: NSCoder) {
            super.init(coder: coder)
            setUp()
        }

        override public func prepareForInterfaceBuilder() {
            setUp()
        }
        
        private func setUp() {
            setTitleColor(.white, for: .normal)
            titleLabel?.font = UIFont.StandardFont.Regular12
        }
    }
