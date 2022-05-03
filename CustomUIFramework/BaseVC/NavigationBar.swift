//
//  NavigationBar.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import Foundation
import UIKit

public struct NavigationViewItem {
    public var image: UIImage? = nil
    public var action: (() -> Void)? = nil
    public init(image: UIImage?, action: (() -> Void)?) {
        self.image = image
        self.action = action
    }
}

@IBDesignable
open class NavigationBar: UIView {
    
    public var items:[NavigationViewItem]? {
        didSet {
            setUpItems()
        }
    }
    
    public var labelTitle = UILabel()
    public var buttonBack = UIButton()
    public var stackViewItems = UIStackView()
    
    @IBInspectable
    public var title: String? {
        didSet {
            labelTitle.text = title
        }
    }
    
//    @IBInspectable
//    public var image: UIImage? = nil {
//        didSet {
//            labelTitle.text = image
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

    public override func prepareForInterfaceBuilder() {
        setUp()
    }
    
    private func setUp() {
        
        addSubview(labelTitle)
        addSubview(buttonBack)
        addSubview(stackViewItems)
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        buttonBack.translatesAutoresizingMaskIntoConstraints = false;
        stackViewItems.translatesAutoresizingMaskIntoConstraints = false;
        
        let image = UIImage(named:"arrow-left")
        buttonBack.setImage(image, for: .normal)
        buttonBack.tintColor = UIColor.white
        
        labelTitle.text = title
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont.StandardFont.Medium16
        
        stackViewItems.axis = .horizontal
        stackViewItems.distribution = .equalSpacing;
        stackViewItems.alignment = .center;
        stackViewItems.spacing = 4;
        
        backgroundColor = UIColor.StandardColor.BUTTONGRAYCOLOR
        
        let views: [String: Any] = [
            "labelTitle": labelTitle,
            "buttonBack": buttonBack,
            "stackViewItems": stackViewItems,
        ]
        
        var allConstraints: [NSLayoutConstraint] = []

        let horizontalButtonBackConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:|-15-[buttonBack]",
          metrics: nil,
          views: views)

        let verticalButtonBackConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-\(10)-[buttonBack]-\(10)-|",
            metrics: nil,
            views: views)
        
        let horizontalStackConstraints = NSLayoutConstraint.constraints(
          withVisualFormat: "H:[stackViewItems]-10-|",
          metrics: nil,
          views: views)
        
        allConstraints += horizontalButtonBackConstraints
        allConstraints += verticalButtonBackConstraints
        allConstraints += horizontalStackConstraints
        
        let buttonBackWidthConstraint = NSLayoutConstraint(item: buttonBack, attribute: .width, relatedBy: .equal, toItem: buttonBack, attribute: .height, multiplier: 1, constant: 0.0)
        
        let titleMiddleYConstraint = NSLayoutConstraint(item: labelTitle, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0.0)
        
        let titleMiddleXConstraint = NSLayoutConstraint(item: labelTitle, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0.0)
        
        let stackMiddleYConstraint = NSLayoutConstraint(item: stackViewItems, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0.0)
        
        allConstraints.append(buttonBackWidthConstraint)
        allConstraints.append(titleMiddleYConstraint)
        allConstraints.append(titleMiddleXConstraint)
        allConstraints.append(stackMiddleYConstraint)
        
        NSLayoutConstraint.activate(allConstraints)
        setUpItems()
    }
    
    func setUpItems() {
        for view in stackViewItems.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        if let items = items {
            var index = 0
            for item in items {
                let button = UIButton()
                button.tag = index  //ugly tag handling
                button.tintColor = UIColor.white
                button.heightAnchor.constraint(equalToConstant: 30).isActive = true
                button.widthAnchor.constraint(equalToConstant: 30).isActive = true
                button.setImage(item.image, for: .normal)
                stackViewItems.addArrangedSubview(button)
                button.addTarget(self, action: #selector(onNavigationItemTapped(sender:)), for: .touchUpInside)
                index += 1
            }
        }
    }
    
    @objc private func onNavigationItemTapped(sender: UIButton) {
        if let items = items {
            let item = items[sender.tag]
            item.action?()
        }
    }
}
