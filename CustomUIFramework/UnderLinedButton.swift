//
//  UnderlinedButton.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class UnderLinedButton: UIButton {

        open var underLineLayer: CALayer? = nil
        
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
            underLineLayer?.removeFromSuperlayer()
            underLineLayer = CALayer()
            
            if let underLineLayer = underLineLayer {
                underLineLayer.frame = CGRect(x: 12, y: frame.size.height-7, width: frame.size.width, height: 1)
                underLineLayer.backgroundColor = titleColor(for: .normal)?.cgColor
                layer.addSublayer(underLineLayer)
            }
        }
    }
