//
//  PopAlertView.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class PopAlertView: UIView {
    
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
    open var affirmImage: UIImage? = nil {
        didSet {
            imageViewAffirm.image = affirmImage
            imageViewAffirm.widthAnchor.constraint(equalToConstant: affirmImage != nil ? 40 : 0).isActive = true
        }
    }
    
    open var labelMessage = UILabel()
    open var containerAffirm = UIView()
    open var containerInnerAffirm = UIView()
    open var buttonAffirm = UIButton()
    open var labelAffirm = UILabel()
    open var imageViewAffirm = UIImageView()
    open var containerView = UIView()
    
    public init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    public init(message: String?, affirmTitle: String?, affirmImage: UIImage?) {
        super.init(frame: CGRect.zero)
        self.message = message
        self.affirmTitle = affirmTitle
        self.affirmImage = affirmImage
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
        containerAffirm.addSubview(containerInnerAffirm)
        containerAffirm.addSubview(buttonAffirm)
        containerInnerAffirm.addSubview(labelAffirm)
        containerInnerAffirm.addSubview(imageViewAffirm)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        containerAffirm.translatesAutoresizingMaskIntoConstraints = false
        containerInnerAffirm.translatesAutoresizingMaskIntoConstraints = false
        buttonAffirm.translatesAutoresizingMaskIntoConstraints = false
        labelAffirm.translatesAutoresizingMaskIntoConstraints = false
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
        
        
        
        let views: [String: Any] = [
          "labelMessage": labelMessage,
          "containerAffirm": containerAffirm,
            "buttonAffirm": buttonAffirm,
            "labelAffirm": labelAffirm,
            "imageViewAffirm": imageViewAffirm,
            "containerInnerAffirm": containerInnerAffirm]

        var allConstraints: [NSLayoutConstraint] = []

        let horizontalLabelMessageConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-20-[labelMessage]-20-|",
          metrics: nil,
          views: views)
        
        
        let verticalConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-20-[labelMessage]-20-[containerAffirm]-20-|",
          metrics: nil,
          views: views)
        
        let horizontalAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-0-[imageViewAffirm]-0-[labelAffirm]-0-|",
          metrics: nil,
          views: views)
        
        
        let verticalLabelAffirmConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-0-[labelAffirm]-0-|",
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
        
        allConstraints += horizontalLabelMessageConstraints
        allConstraints += verticalConstraints
        allConstraints += horizontalAffirmConstraints
        allConstraints += verticalLabelAffirmConstraints
        allConstraints += horizontalInnerAffirmConstraints
        allConstraints += verticalInnerAffirmConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        
        containerInnerAffirm.centerYAnchor.constraint(equalTo: containerAffirm.centerYAnchor).isActive = true
        containerInnerAffirm.centerXAnchor.constraint(equalTo: containerAffirm.centerXAnchor).isActive = true
        imageViewAffirm.heightAnchor.constraint(equalTo: imageViewAffirm.widthAnchor).isActive = true
        imageViewAffirm.widthAnchor.constraint(equalToConstant: affirmImage != nil ? 40 : 0).isActive = true
        containerAffirm.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageViewAffirm.centerYAnchor.constraint(equalTo: containerInnerAffirm.centerYAnchor).isActive = true
        
        
        buttonAffirm.addTarget(self, action: #selector(onAffirmTapped), for: .touchUpInside)
        
        buttonAffirm.topAnchor.constraint(equalTo: containerAffirm.topAnchor).isActive = true
        buttonAffirm.bottomAnchor.constraint(equalTo: containerAffirm.bottomAnchor).isActive = true
        buttonAffirm.leadingAnchor.constraint(equalTo: containerAffirm.leadingAnchor).isActive = true
        buttonAffirm.trailingAnchor.constraint(equalTo: containerAffirm.trailingAnchor).isActive = true
        

        containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc private func onAffirmTapped() {
        self.removeFromSuperview()
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        containerAffirm.layer.cornerRadius = 20
        containerAffirm.layer.borderWidth = 1.5
        containerAffirm.layer.borderColor = UIColor.StandardColor.PrimaryBlue.cgColor
        containerView.layer.cornerRadius = 10
    }
}

extension PopAlertView {
    static public func popWithTitle(message: String, affirmTitle: String = "OK", affirmImage: UIImage? = nil, completion: (() -> Void)! = nil) {
        let alert = PopAlertView(message: message, affirmTitle: affirmTitle, affirmImage: affirmImage)
        guard completion != nil else {
            return
        }
        completion()
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
