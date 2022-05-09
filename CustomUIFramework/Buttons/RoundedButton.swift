//
//  RoundedButton.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
public class RoundedButton: UIButton {
    
    @IBInspectable
open var styleNumber: String? {
        didSet {
            self.styleNo = styleNumber
            setUp()
        }
    }
    
    open var styleNo : String? = nil
    
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
        let fontName = InfoplistButtonParser.getStringValue(key: Constants.Plist.FontName, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        let fontSize = InfoplistButtonParser.getIntValue(key: Constants.Plist.FontSize, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        let fontColor = InfoplistButtonParser.getStringValue(key: Constants.Plist.FontColor, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        let backgroundColor = InfoplistButtonParser.getStringValue(key: Constants.Plist.BackgroundColor, styleNo: styleNo ?? Constants.Plist.DefaultStyle)
        self.titleLabel?.font = UIFont(name: fontName, size: CGFloat(fontSize))
        self.setTitleColor(UIColor(hex: fontColor), for: .normal)
        self.backgroundColor = UIColor(hex: backgroundColor)
        layer.cornerRadius = frame.size.height / 2
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
