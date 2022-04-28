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
    open var image: UIImage? {
            didSet {
                imageView.image = image
                constraintImageWidth?.constant = image != nil ? 30 : 0
            }
        }
        
        @IBInspectable
    open var rightActionImage: UIImage? {
            didSet {
                buttonRightAction.setImage(rightActionImage, for: .normal)
                constraintRightActionButtonWidth?.constant = rightActionImage != nil ? 30 : 0
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
        
        open var imageView: UIImageView = UIImageView()
        open var textField: UITextField = UITextField()
        open var underlinerView: UIView = UIView()
        open var labelHeading: UILabel = UILabel()
        open var buttonRightAction: UIButton = UIButton()
        open var labelInvalidHeading: UILabel = UILabel()
        open var textView: UITextView = UITextView()
        open var constraintImageWidth: NSLayoutConstraint? = nil
        open var constraintHeaderHeight: NSLayoutConstraint? = nil
        open var constraintRightActionButtonWidth: NSLayoutConstraint? = nil
        
    open var rightAction: (() -> Void)? = nil
    
//    open var validator: Validator?  = nil
//
//    open var isValid: Bool {
//        get {
//            if let validator = validator {
//                return validator.validate(input: self.text ?? "")
//            }
//            return true
//        }
//    }

        
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
            
            addSubview(imageView)
            addSubview(textField)
            addSubview(buttonRightAction)
            addSubview(labelInvalidHeading)
            addSubview(textView)
            addSubview(underlinerView)
            addSubview(labelHeading)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            underlinerView.translatesAutoresizingMaskIntoConstraints = false
            labelHeading.translatesAutoresizingMaskIntoConstraints = false
            buttonRightAction.translatesAutoresizingMaskIntoConstraints = false
            labelInvalidHeading.translatesAutoresizingMaskIntoConstraints = false
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.contentMode = .scaleAspectFit
            underlinerView.backgroundColor = UIColor.lightGray
            
            textField.text = text
            textField.placeholder = placeholder
            textField.font = .systemFont(ofSize: 12, weight: .regular)
            textField.textColor = UIColor.black
            textField.delegate = self
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            
            textView.text = text
            textView.font = .systemFont(ofSize: 14, weight: .regular)
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
            labelHeading.font = .systemFont(ofSize: 14, weight: .light)
            labelHeading.textColor = .darkGray
            labelInvalidHeading.textColor = UIColor.red
            labelInvalidHeading.font = .systemFont(ofSize: 10, weight: .ultraLight)
            
            buttonRightAction.imageView?.contentMode = .scaleAspectFit
            
            let views: [String: Any] = [
                "imageView": imageView,
                "textFieldView": textField,
                "underlinerView": underlinerView,
                "labelHeading": labelHeading,
                "buttonRightAction": buttonRightAction,
                "labelInvalidHeading": labelInvalidHeading,
                "textView": textView]
            
            var allConstraints: [NSLayoutConstraint] = []

            let horizontalConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[imageView]-[textFieldView]-0-[buttonRightAction]-0-|",
              metrics: nil,
              views: views)

            let verticalImageConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[labelHeading]-8-[imageView]-8-|",
                metrics: nil,
                views: views)

            let verticalTexfieldConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[labelHeading]-0-[textFieldView]-0-|",
                metrics: nil,
                views: views)
            
            let verticalRightActionConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[labelHeading]-0-[buttonRightAction]-0-|",
                metrics: nil,
                views: views)
            
            let horizontalUnderlinerConstrains = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[underlinerView]-0-|",
                metrics: nil,
                views: views)
            
            let verticalUnderlinerConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "V:[underlinerView(2)]-0-|",
                metrics: nil,
                views: views)
            
            let horizontalTitleConstraints = NSLayoutConstraint.constraints(
              withVisualFormat: "H:|-0-[labelHeading]-[labelInvalidHeading]",
              metrics: nil,
              views: views)

            allConstraints += horizontalConstraints
            allConstraints += verticalImageConstraints
            allConstraints += verticalTexfieldConstraints
            allConstraints += verticalRightActionConstraints
            allConstraints += horizontalUnderlinerConstrains
            allConstraints += verticalUnderlinerConstraints
            allConstraints += horizontalTitleConstraints

            NSLayoutConstraint.activate(allConstraints)
            
            constraintImageWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: image != nil ? 30 : 0)
            
            constraintHeaderHeight = NSLayoutConstraint(item: labelHeading, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: heading != nil ? 12 : 0)
            
            constraintRightActionButtonWidth = NSLayoutConstraint(item: buttonRightAction, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: rightActionImage != nil ? 30 : 0)
            
            constraintImageWidth?.isActive = true
            constraintHeaderHeight?.isActive = true
            constraintRightActionButtonWidth?.isActive = true
            
            labelInvalidHeading.topAnchor.constraint(equalTo: labelHeading.topAnchor).isActive = true
            labelInvalidHeading.bottomAnchor.constraint(equalTo: labelHeading.bottomAnchor).isActive = true
            textView.topAnchor.constraint(equalTo: textField.topAnchor).isActive = true
            textView.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
            textView.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
            textView.rightAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
            
            buttonRightAction.addTarget(self, action: #selector(onRightActionTapped), for: .touchUpInside)
            
        }

//        public func validate() -> Bool {
//            if let validator = validator {
//                let isValid = validator.validate(input: text)
//                labelInvalidHeading.text = isValid ? nil : validator.invalidMessage
//                return isValid
//            } else {
//                labelInvalidHeading.text = nil
//                return true
//            }
//        }
        
        @objc private func onRightActionTapped() {
            rightAction?()
        }
    }

    extension InputField: UITextFieldDelegate {
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return false
        }
    }
