//
//  TwoLinedButton.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit


@IBDesignable
public class TwoLinedButton: UIButton {
    
    @IBInspectable
    open var primaryText: String? = nil {
        didSet {
            primaryLabel.text = primaryText
            primaryLabel.numberOfLines = 1
            primaryLabel.textAlignment = .center
            primaryLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        }
    }
    
    @IBInspectable
    open var secondaryText: String? = nil {
        didSet {
            secondaryLabel.text = secondaryText
            secondaryLabel.numberOfLines = 1
            secondaryLabel.textAlignment = .center
            secondaryLabel.font = .systemFont(ofSize: 18, weight: .regular)
        }
    }
    
    @IBInspectable
open var primaryTextColor: UIColor = UIColor.white {
        didSet {
            primaryLabel.textColor = primaryTextColor
        }
    }
    
    @IBInspectable
open var secondaryTextColor: UIColor = UIColor.white {
        didSet {
            secondaryLabel.textColor = secondaryTextColor
        }
    }
    
    @IBInspectable
open var buttonBackgroundColor: UIColor = UIColor.green {
        didSet {
            backgroundColor = buttonBackgroundColor
        }
    }
    
    open var primaryLabel = UILabel()
    open var secondaryLabel = UILabel()
    
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
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryLabel.text = primaryText
        secondaryLabel.text = secondaryText
        primaryLabel.textColor = primaryTextColor
        secondaryLabel.textColor = secondaryTextColor
        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = buttonBackgroundColor
    }
    
    public override func layoutSubviews() {
                super.layoutSubviews()
                primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2)
                secondaryLabel.frame = CGRect(x: 0, y: frame.size.height/2, width: frame.size.width, height: frame.size.height/2)
            }
}

