//
//  InputField.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class InputField: UIView {
    
    
    @IBInspectable
    open var rightActionText: String? {
        didSet {
            buttonRightAction.setTitle(rightActionText, for: .normal)
            constraintRightActionButtonWidth?.constant = rightActionText != nil ? 80 : 0
        }
    }
    
    @IBInspectable
    open var placeholder: String? {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        }
    }
    
    @IBInspectable
    open var text: String? {
        get {
            return textField.isHidden == true ? textView.text : textField.text
        }
        set {
            textField.text = newValue
            textView.text = newValue
        }
    }
    
    @IBInspectable
    open var numberOfLines: Int = 1 {
        didSet {
            if numberOfLines != 1 {
                textView.isHidden = false
                textField.isHidden = true
                textView.text = textField.text
            } else {
                textView.isHidden = true
                textField.isHidden = false
                textField.text = textView.text
            }
        }
    }
    
    @IBInspectable
    open var heading: String? {
        didSet {
            labelHeading.text = heading
            constraintHeaderHeight?.constant = heading != nil ? 12 : 0
        }
    }
    
    @IBInspectable
    open var textColor: UIColor = UIColor.black {
        didSet {
            textField.textColor = textColor
        }
    }
    
    @IBInspectable
    open var isSecureTextEntry: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    @IBInspectable
    open var dismissOnReturn = true
    
    open var textField: UITextField = UITextField()
    open var labelHeading: UILabel = UILabel()
    open var buttonRightAction: UIButton = UIButton()
    open var textView: UITextView = UITextView()
    open var constraintHeaderHeight: NSLayoutConstraint? = nil
    open var constraintRightActionButtonWidth: NSLayoutConstraint? = nil
    open var constraintTextFieldVertical: NSLayoutConstraint? = nil
    
    open var rightAction: (() -> Void)? = nil
    
    
    
    public init() {
        super.init(frame: CGRect.zero)
        setUp()
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
        
        addSubview(textField)
        addSubview(buttonRightAction)
        addSubview(textView)
        addSubview(labelHeading)
        
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.StandardColor.VeryLightGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        labelHeading.translatesAutoresizingMaskIntoConstraints = false
        buttonRightAction.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.text = text
        textField.placeholder = placeholder
        textField.font = UIFont.StandardFont.Regular16
        textField.textColor = UIColor.black
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        textView.text = text
        textView.font = UIFont.StandardFont.Regular16
        textView.textColor = UIColor.black
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        
        if numberOfLines != 1 {
            textView.isHidden = false
            textField.isHidden = true
        } else {
            textView.isHidden = true
            textField.isHidden = false
        }
        
        labelHeading.text = heading
        labelHeading.font = UIFont.StandardFont.Regular14
        labelHeading.textColor = UIColor.StandardColor.PrimaryBlue
        labelHeading.isHidden = true
        
        buttonRightAction.setTitle(rightActionText, for: .normal)
        buttonRightAction.setTitleColor(UIColor.StandardColor.PrimaryBlue, for: .normal)
        buttonRightAction.titleLabel?.font = UIFont.StandardFont.Bold16
        
        let horizontalTextFieldConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 12)
        let horizontalButtonRightConstraint = NSLayoutConstraint(item: buttonRightAction, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: 5)
        
        let verticalLabelHeadingConstraint = NSLayoutConstraint(item: labelHeading, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 5)
        let verticalLabelHeadingTextFieldConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: labelHeading, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 10)
        let verticalTextFieldConstraint = NSLayoutConstraint(item: textField, attribute: NSLayoutConstraint.Attribute.bottomMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 0)
        
        let verticalLabelHeadingButtonRightConstraint = NSLayoutConstraint(item: buttonRightAction, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: labelHeading, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 0)
        let verticalButtonRightConstraint = NSLayoutConstraint(item: buttonRightAction, attribute: NSLayoutConstraint.Attribute.bottomMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 5)
        
        let horizontalTitleConstraint = NSLayoutConstraint(item: labelHeading, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant:12)
        
        addConstraints([horizontalTextFieldConstraint, horizontalButtonRightConstraint, verticalLabelHeadingConstraint, verticalLabelHeadingTextFieldConstraint, verticalTextFieldConstraint, verticalLabelHeadingButtonRightConstraint, verticalButtonRightConstraint, horizontalTitleConstraint])
        
        
        constraintHeaderHeight = NSLayoutConstraint(item: labelHeading, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: heading != nil ? 12 : 0)
        
        constraintRightActionButtonWidth = NSLayoutConstraint(item: buttonRightAction, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: rightActionText != nil ? 30 : 0)
        
        constraintHeaderHeight?.isActive = true
        constraintRightActionButtonWidth?.isActive = true
        
        textView.topAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
        
        buttonRightAction.addTarget(self, action: #selector(onRightActionTapped), for: .touchUpInside)
    }
    
    @objc private func onRightActionTapped() {
        rightAction?()
    }
}

extension InputField: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderColor = UIColor.StandardColor.ButtonGray.cgColor
        layer.borderWidth = 1
        labelHeading.isHidden = false
        labelHeading.textColor = UIColor.StandardColor.PrimaryBlue
        textField.placeholder = nil
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
        labelHeading.textColor = UIColor.StandardColor.ButtonGray
        textField.placeholder = textField.text!.isEmpty ? placeholder : nil
        labelHeading.isHidden = textField.text!.isEmpty ? true : false
    }
}
