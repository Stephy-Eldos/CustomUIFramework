//
//  TintedImageView.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import Foundation
import UIKit

@IBDesignable
open class TintedImageView: UIView {
    
    @IBInspectable
    open var image: UIImage? {
        didSet {
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            imageView.tintColor = tintColor
        }
    }
    
    private var imageView = UIImageView()
    
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

    open override func prepareForInterfaceBuilder() {
        setUp()
    }
    
    func setUp() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = tintColor
        imageView.contentMode = .scaleAspectFit
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
