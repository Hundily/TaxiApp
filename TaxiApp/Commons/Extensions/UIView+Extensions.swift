//
//  UIView+Extensions.swift
//  PicPayment
//
//  Created by Hundily Cerqueira on 11/09/19.
//  Copyright © 2019 PicPayment. All rights reserved.
//

import UIKit.UIView
import UIKit.NSLayoutConstraint

typealias NSLayoutDimensionHeightAndWidth = (NSLayoutConstraint?, NSLayoutConstraint?)
typealias NSLayoutConstraintXAndY = (NSLayoutConstraint?, NSLayoutConstraint?)

extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: insets.top))
        }

        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: insets.left))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -insets.bottom))
        }

        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -insets.right))
        }

        NSLayoutConstraint.activate(anchors)

        return anchors
    }

    @discardableResult
    func anchor(height: CGFloat? = nil, width: CGFloat? = nil) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let width = width {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }

        if let height = height {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }

        NSLayoutConstraint.activate(anchors)

        return anchors
    }

    @discardableResult
    func anchor(heightAnchor: NSLayoutDimension? = nil,
                heightMultiplier: CGFloat = 1,
                widthAnchor: NSLayoutDimension? = nil,
                widthMultiplier: CGFloat = 1) -> NSLayoutDimensionHeightAndWidth {
        translatesAutoresizingMaskIntoConstraints = false

        var heightConstraint: NSLayoutConstraint?
        var widthConstraint: NSLayoutConstraint?

        if let heightAnchor = heightAnchor {
            heightConstraint = self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier)
            heightConstraint?.isActive = true
        }

        if let widthAnchor = widthAnchor {
            widthConstraint = self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthMultiplier)
            widthConstraint?.isActive = true
        }

        return (heightConstraint, widthConstraint)
    }

    @discardableResult
    func anchorCenterXToSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false

        if let centerXAnchor = superview?.centerXAnchor {
            let anchor = self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: constant)
            anchor.isActive = true
            return anchor
        }

        return nil
    }

    @discardableResult
    func anchorCenterYToSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false

        if let centerYAnchor = superview?.centerYAnchor {
            let anchor = self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: constant)
            anchor.isActive = true
            return anchor
        }

        return nil
    }

    @discardableResult
    func anchorCenterSuperview() -> NSLayoutConstraintXAndY {
        let centerXAnchor = anchorCenterXToSuperview()
        let centerYAnchor = anchorCenterYToSuperview()

        return (centerXAnchor, centerYAnchor)
    }
    
    func fullSuperview(insets: UIEdgeInsets = .zero) {
        anchor(
            top: superview?.topAnchor,
            leading: superview?.leadingAnchor,
            bottom: superview?.bottomAnchor,
            trailing: superview?.trailingAnchor,
            insets: insets
        )
    }
    
    func loadCustomView(viewClass: UIView) {
        let nibName = String(describing: type(of: viewClass.self))
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
    }
    
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero

        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }

        layer.colors = layerColorSet
        layer.locations = layerLocations

        if let startEndPoints = startEndPoints {
            layer.startPoint = startEndPoints.0
            layer.endPoint = startEndPoints.1
        }

        self.layer.insertSublayer(layer, above: self.layer)
    }
    
    func addShandowView(radius: CGFloat, cornerRadius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.23
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}
