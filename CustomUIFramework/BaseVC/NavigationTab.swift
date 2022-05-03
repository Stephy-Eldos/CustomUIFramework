//
//  NavigationTab.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import Foundation
import UIKit

public class NavigationTab: UIView {
    
    public var currentSelectedIndex: Int = -1 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    public var items = [NavigationTabItem]()
    
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
    
    private func setUp() {
        
        collectionView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [UIColor.StandardColor.LIGHTGRAYCOLOR.cgColor, UIColor.StandardColor.VERYLIGHTGRAYCOLOR.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 0.4, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: 10)
        layer.insertSublayer(gradientLayer, at: 0)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        collectionView.register(HorizontalNavigationBarCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func reloadData() {
        collectionView.reloadData()
    }

}

public struct NavigationTabItem {
    public var title: String? = nil
    public var image: UIImage? = nil
    public var action: (() -> Void)? = nil
    public var width: CGFloat = 90.0
    
    public init(title: String?, image: UIImage?, action: (() -> Void)?, width: CGFloat) {
        self.title = title
        self.image = image
        self.action = action
        self.width = width
    }
}

public class HorizontalNavigationBarCell: UICollectionViewCell {
    
    public let imageView = TintedImageView()
    public let label = UILabel()
    public var labelHeight: CGFloat = 12
    public var constraintLabelHeight: NSLayoutConstraint? = nil
    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                label.textColor = tintColor
                imageView.tintColor = tintColor
            } else {
                label.textColor = UIColor.StandardColor.DARKGRAYCOLOR
                imageView.tintColor = UIColor.StandardColor.DARKGRAYCOLOR
            }
        }
    }
    
    public var item: NavigationTabItem? {
        didSet {
            imageView.image = item?.image
            imageView.heightAnchor.constraint(equalToConstant:0).isActive = item?.image == nil ? true : false
            
            label.text = item?.title
            label.font = item?.image != nil ? UIFont.StandardFont.Light14 : UIFont.StandardFont.Bold16
            constraintLabelHeight?.constant = item?.title?.count ?? 0 > 0 ? labelHeight : 0
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        backgroundColor = UIColor.clear
        
        addSubview(imageView)
        addSubview(label)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = item?.image
        imageView.tintColor = UIColor.white
        
        label.text = item?.title
        label.textAlignment = .center
        label.font = item?.image != nil ? UIFont.StandardFont.Light14 : UIFont.StandardFont.Bold16
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        let views: [String: Any] = [
            "imageView": imageView,
            "label": label]

        
        var allConstraints: [NSLayoutConstraint] = []
        
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[imageView]-8-[label]-10-|",
            metrics: nil,
            views: views)
        
        let horizontalImageViewConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[imageView]-0-|",
            metrics: nil,
            views: views)
        
        let horizontalLabelConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[label]-0-|",
            metrics: nil,
            views: views)
        
        allConstraints += verticalConstraints
        allConstraints += horizontalImageViewConstraints
        allConstraints += horizontalLabelConstraints

        NSLayoutConstraint.activate(allConstraints)
        
        constraintLabelHeight = label.heightAnchor.constraint(equalToConstant: item?.title?.count ?? 0 > 0 ? labelHeight : 0)
        constraintLabelHeight?.isActive = true
    }
}

extension NavigationTab: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: CollectionView Datasource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HorizontalNavigationBarCell
        
        let item = items[indexPath.row]
        cell.tintColor = tintColor
        cell.item = item
        cell.isHighlighted = indexPath.row == currentSelectedIndex ? true : false
        
        return cell
    }
    
    //MARK: CollectionView Delegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelectedIndex = indexPath.row
        let item = items[indexPath.row]
        item.action?()
        collectionView.reloadData()
    }
    
    //MARK: CollectionViewFlow Delegate
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = items[indexPath.row]
        return CGSize(width: item.width, height: collectionView.frame.size.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
