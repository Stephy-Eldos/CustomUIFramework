//
//  Light14Label.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 29/4/22.
//

import UIKit

@IBDesignable
public class Light14Label: UILabel {
    
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
        self.font = .systemFont(ofSize: 14, weight: .light)
    }
}
