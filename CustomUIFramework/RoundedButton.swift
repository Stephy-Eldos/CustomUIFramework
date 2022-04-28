//
//  RoundedButton.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
public class RoundedButton: UIButton {
    
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
        layer.cornerRadius = frame.size.height / 2
        backgroundColor = .black
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
