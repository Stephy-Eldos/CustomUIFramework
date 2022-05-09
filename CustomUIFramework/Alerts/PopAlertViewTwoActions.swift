//
//  PopAlertView.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class PopAlertViewTwoActions: UIView {
    
    @IBInspectable
    open var message: String? = nil {
        didSet {
            labelMessage.text = message
        }
    }
    @IBInspectable
    open var affirmTitle: String? = nil {
        didSet {
            labelAffirm.text = affirmTitle
        }
    }
    
    @IBInspectable
    open var affirmTitle2: String? = nil {
        didSet {
            labelAffirm2.text = affirmTitle2
        }
    }
    
    @IBInspectable
    open var affirmImage: UIImage? = nil {
        didSet {
            imageViewAffirm.image = affirmImage
            imageViewAffirm.widthAnchor.constraint(equalToConstant: affirmImage != nil ? 40 : 0).isActive = true
        }
    }
    
    open var labelMessage = UILabel()
    open var containerAffirm = UIView()
    open var containerInnerAffirm = UIView()
    open var containerAffirm2 = UIView()
    open var containerInnerAffirm2 = UIView()
    open var buttonAffirm = UIButton()
    open var buttonAffirm2 = UIButton()
    open var labelAffirm = UILabel()
    open var labelAffirm2 = UILabel()
    open var imageViewAffirm = UIImageView()
    open var containerView = UIView()
    open var actionFirstButton: (() -> Void)? = nil
    open var actionSecondButton: (() -> Void)? = nil
    
    public init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    public init(message: String?, affirmTitle: String?, affirmTitle2: String?, affirmImage: UIImage?, actionFirstButton: (() -> Void)?, actionSecondButton: (() -> Void)?) {
        super.init(frame: CGRect.zero)
        self.message = message
        self.affirmTitle = affirmTitle
        self.affirmTitle2 = affirmTitle2
        self.affirmImage = affirmImage
        self.actionFirstButton = actionFirstButton
        self.actionSecondButton = actionSecondButton
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
        backgroundColor = UIColor.gray
        
        addSubview(containerView)
        containerView.addSubview(labelMessage)
        containerView.addSubview(containerAffirm)
        containerView.addSubview(containerAffirm2)
        containerAffirm.addSubview(containerInnerAffirm)
        containerAffirm2.addSubview(containerInnerAffirm2)
        containerAffirm.addSubview(buttonAffirm)
        containerAffirm2.addSubview(buttonAffirm2)
        containerInnerAffirm.addSubview(labelAffirm)
        containerInnerAffirm2.addSubview(labelAffirm2)
        containerInnerAffirm.addSubview(imageViewAffirm)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        containerAffirm.translatesAutoresizingMaskIntoConstraints = false
        containerAffirm2.translatesAutoresizingMaskIntoConstraints = false
        containerInnerAffirm.translatesAutoresizingMaskIntoConstraints = false
        containerInnerAffirm2.translatesAutoresizingMaskIntoConstraints = false
        buttonAffirm.translatesAutoresizingMaskIntoConstraints = false
        buttonAffirm2.translatesAutoresizingMaskIntoConstraints = false
        labelAffirm.translatesAutoresizingMaskIntoConstraints = false
        labelAffirm2.translatesAutoresizingMaskIntoConstraints = false
        imageViewAffirm.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor.white
        backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        labelMessage.textAlignment = .center
        labelMessage.font = .systemFont(ofSize: 16, weight: .regular)
        labelMessage.textColor = UIColor.darkGray
        labelMessage.text = message
        labelMessage.numberOfLines = 0
        
        imageViewAffirm.image = affirmImage
        imageViewAffirm.tintColor = UIColor.StandardColor.PrimaryBlue
        
        labelAffirm.textColor = UIColor.StandardColor.PrimaryBlue
        labelAffirm.text = affirmTitle
        labelAffirm2.textColor = UIColor.white
        labelAffirm2.text = affirmTitle2
        
        
        let views: [String: Any] = [
          "labelMessage": labelMessage,
          "containerAffirm": containerAffirm,
          "containerAffirm2": containerAffirm2,
            "buttonAffirm": buttonAffirm,
          "buttonAffirm2": buttonAffirm2,
            "labelAffirm": labelAffirm,
          "labelAffirm2": labelAffirm2,
            "imageViewAffirm": imageViewAffirm,
            "containerInnerAffirm": containerInnerAffirm,
          "containerInnerAffirm2": containerInnerAffirm2]

        var allConstraints: [NSLayoutConstraint] = []

        let horizontalLabelMessageConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-20-[labelMessage]-20-|",
          metrics: nil,
          views: views)
        
        
        let verticalConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-20-[labelMessage]-20-[containerAffirm]-20-[containerAffirm2]-20-|",
          metrics: nil,
          views: views)
        
        let horizontalAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-0-[imageViewAffirm]-0-[labelAffirm]-0-|",
          metrics: nil,
          views: views)
        
        let horizontalAffirm2Constraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-0-[labelAffirm2]-0-|",
          metrics: nil,
          views: views)
        
        let verticalLabelAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-0-[labelAffirm]-0-|",
          metrics: nil,
          views: views)
        
        let verticalLabelAffirm2Constraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-0-[labelAffirm2]-0-|",
          metrics: nil,
          views: views)
        
        let horizontalInnerAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-30-[containerInnerAffirm]-30-|",
          metrics: nil,
          views: views)
        
        let verticalInnerAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-10-[containerInnerAffirm]-10-|",
          metrics: nil,
          views: views)
        
        let horizontalInnerAffirm2Constraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-30-[containerInnerAffirm2]-30-|",
          metrics: nil,
          views: views)
        
        let verticalInnerAffirm2Constraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-10-[containerInnerAffirm2]-10-|",
          metrics: nil,
          views: views)
        
        allConstraints += horizontalLabelMessageConstraints
        allConstraints += verticalConstraints
        allConstraints += horizontalAffirmConstraints
        allConstraints += horizontalAffirm2Constraints
        allConstraints += verticalLabelAffirmConstraints
        allConstraints += verticalLabelAffirm2Constraints
        allConstraints += horizontalInnerAffirmConstraints
        allConstraints += verticalInnerAffirmConstraints
        allConstraints += horizontalInnerAffirm2Constraints
        allConstraints += verticalInnerAffirm2Constraints
        
        NSLayoutConstraint.activate(allConstraints)
        
        containerInnerAffirm.centerYAnchor.constraint(equalTo: containerAffirm.centerYAnchor).isActive = true
        containerInnerAffirm.centerXAnchor.constraint(equalTo: containerAffirm.centerXAnchor).isActive = true
        containerInnerAffirm2.centerYAnchor.constraint(equalTo: containerAffirm2.centerYAnchor).isActive = true
        containerInnerAffirm2.centerXAnchor.constraint(equalTo: containerAffirm2.centerXAnchor).isActive = true
        imageViewAffirm.heightAnchor.constraint(equalTo: imageViewAffirm.widthAnchor).isActive = true
        imageViewAffirm.widthAnchor.constraint(equalToConstant: affirmImage != nil ? 40 : 0).isActive = true
        containerAffirm.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        containerAffirm2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageViewAffirm.centerYAnchor.constraint(equalTo: containerInnerAffirm.centerYAnchor).isActive = true
        
        buttonAffirm.addTarget(self, action: #selector(onAffirm1Tapped), for: .touchUpInside)
        
        buttonAffirm.topAnchor.constraint(equalTo: containerAffirm.topAnchor).isActive = true
        buttonAffirm.bottomAnchor.constraint(equalTo: containerAffirm.bottomAnchor).isActive = true
        buttonAffirm.leadingAnchor.constraint(equalTo: containerAffirm.leadingAnchor).isActive = true
        buttonAffirm.trailingAnchor.constraint(equalTo: containerAffirm.trailingAnchor).isActive = true
        
        buttonAffirm2.addTarget(self, action: #selector(onAffirm2Tapped), for: .touchUpInside)
        
        buttonAffirm2.topAnchor.constraint(equalTo: containerAffirm2.topAnchor).isActive = true
        buttonAffirm2.bottomAnchor.constraint(equalTo: containerAffirm2.bottomAnchor).isActive = true
        buttonAffirm2.leadingAnchor.constraint(equalTo: containerAffirm2.leadingAnchor).isActive = true
        buttonAffirm2.trailingAnchor.constraint(equalTo: containerAffirm2.trailingAnchor).isActive = true

        containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc private func onAffirm1Tapped() {
        self.removeFromSuperview()
        actionFirstButton?()
    }
    
    @objc private func onAffirm2Tapped() {
        self.removeFromSuperview()
        actionSecondButton?()
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        containerAffirm.layer.cornerRadius = 20
        containerAffirm.layer.borderWidth = 1.5
        containerAffirm.layer.borderColor = UIColor.StandardColor.PrimaryBlue.cgColor
        
        containerAffirm2.layer.cornerRadius = 20
        containerAffirm2.layer.borderWidth = 1.5
        containerAffirm2.layer.borderColor = UIColor.StandardColor.DarkGray.cgColor
        containerAffirm2.backgroundColor = UIColor.StandardColor.DarkGray
        
        containerView.layer.cornerRadius = 10
    }
}

extension PopAlertViewTwoActions {
    static public func popWithTwoActions(message: String, affirmTitle: String = "OK", affirmTitle2: String, affirmImage: UIImage? = nil, actionFirstButton: (() -> Void)?, actionSecondButton: (() -> Void)?) {
        let alert = PopAlertViewTwoActions(message: message, affirmTitle: affirmTitle, affirmTitle2: affirmTitle2, affirmImage: affirmImage, actionFirstButton: actionFirstButton, actionSecondButton: actionSecondButton)
       
        if let parentView = UIApplication.shared.windows.first {
            parentView.addSubview(alert)
            alert.translatesAutoresizingMaskIntoConstraints = false
            alert.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            alert.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            alert.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            alert.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        }
    }
}
