//
//  UIView+Extensions.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//


import UIKit

enum AssociatedKeys {
    static var skeletonState = "isEnableSkeleton"
    
}

public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation

public extension UIView {
    
    var skeletonLayerName: String {
        return "SkeletonLayer.Key"
    }
    
    var skeletonGradientName: String {
        return "SkeletonGradient.Key"
    }
    
    var isDisableSkeleton: Bool {
        get { return ao_get(pkey: &AssociatedKeys.skeletonState) as? Bool ?? false }
        set { ao_set(newValue, pkey: &AssociatedKeys.skeletonState) }
    }
    
    private func skeletonViews(in view: UIView) -> [UIView] {
        var results = [UIView]()
        for subview in view.subviews as [UIView] {
            if !subview.isDisableSkeleton {
                switch subview {
                case _ where subview.isKind(of: UILabel.self):
                    results += [subview]
                case _ where subview.isKind(of: UIImageView.self):
                    results += [subview]
                case _ where subview.isKind(of: UIButton.self):
                    results += [subview]
                case _ where subview.isKind(of: UITextView.self):
                   results += [subview]
                case _ where subview.isKind(of: UITextField.self):
                    results += [subview]
                default: results += skeletonViews(in: subview)
                }
            }
        }
        return results
    }
    
}

public extension UIView {
    
    func startSkeleton() {
        let allViews = skeletonViews(in: self)
        allViews.forEach({ val in
            val.clipsToBounds = true
            val.startAnimation()
            
        })
    }
    
    func startAnimation() {
        setShapeLayer()
        let gradient = CAGradientLayer()
        gradient.masksToBounds = false
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.name = skeletonGradientName
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let mainColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        gradient.colors = [mainColor.cgColor,
                           mainColor.brightened(by: 0.93).cgColor,
                           mainColor.cgColor]
        self.layer.addSublayer(gradient)
        gradient.transition(to: .leftRight)
    }
    
    func setShapeLayer() {
        let layer = CAShapeLayer()
        layer.cornerRadius = self.layer.cornerRadius
        layer.name = skeletonLayerName
        layer.masksToBounds = false
        let layerPath: CGRect =  CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let path = UIBezierPath(roundedRect: layerPath, cornerRadius: 0)
        layer.fillColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
        if let btn = self as? UIButton {
            btn.layer.insertSublayer(layer, above: btn.titleLabel?.layer)
            btn.layer.borderWidth = -1
        }
    }
    
    func stopSkeleton() {
        skeletonViews(in: self).forEach {
            $0.layer.sublayers?.removeAll {
                $0.name == skeletonLayerName || $0.name == skeletonGradientName
            }
        }
    }
}

extension UIColor {
    func brightened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
    }
}
