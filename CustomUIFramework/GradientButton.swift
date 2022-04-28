//
//  GradientColor.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit

@IBDesignable
open class GradientButton: UIButton {
    
    @IBInspectable
    open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    open var startColor: UIColor = UIColor.black {
        didSet {
            gradientLayer.colors = [ startColor.cgColor, endColor.cgColor ]
        }
    }
    
    @IBInspectable
    open var endColor: UIColor = UIColor.white {
        didSet {
            gradientLayer.colors = [ startColor.cgColor, endColor.cgColor ]
        }
    }
    
    @IBInspectable
    open var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5) {
        didSet {
            gradientLayer.startPoint = startPoint
        }
    }
    
    @IBInspectable
    open var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5) {
        didSet {
            gradientLayer.endPoint = endPoint
        }
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.needsDisplayOnBoundsChange = true
        gradient.colors = [startColor, endColor].map { $0.cgColor }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.locations = [0.0, 1.0]
        return gradient
    }()
    
    //MARK: Init
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public func prepareForInterfaceBuilder() {
        setup()
    }
    
    //MARK: setup
    private func setup() {
        layer.insertSublayer(gradientLayer, at: 0)
        setCornerRadius()
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
    }
    
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
}
