//
//  Light14Label.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 29/4/22.
//

import UIKit

@IBDesignable
public class CustomLabel: UILabel {
    
    @IBInspectable
    open var styleNumber: String? {
        didSet {
            self.styleNo = styleNumber
            setUp()
        }
    }
    
    open var styleNo : String? = nil
    
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
        let fontName = InfoplistLabelParser.getStringValue(key: Constants.Plist.FontName, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        let fontSize = InfoplistLabelParser.getIntValue(key: Constants.Plist.FontSize, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        let fontColor = InfoplistLabelParser.getStringValue(key: Constants.Plist.FontColor, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        self.font = UIFont(name: fontName, size: CGFloat(fontSize))
        self.textColor = UIColor(hex: fontColor)
    }
}

