//
//  UIView+Extensions.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit


public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation

public extension UIView {
    
    class func getAllSubviews<T: UIView>(from parenView: UIView) -> [T] {
        return parenView.subviews.flatMap { subView -> [T] in
            var result = getAllSubviews(from: subView) as [T]
            if let view = subView as? T { result.append(view) }
            return result
        }
    }
    
    class func getAllSubviews(from parenView: UIView, types: [UIView.Type]) -> [UIView] {
        return parenView.subviews.flatMap { subView -> [UIView] in
            var result = getAllSubviews(from: subView) as [UIView]
            for type in types {
                if subView.classForCoder == type {
                    result.append(subView)
                    return result
                }
            }
            return result
        }
    }
    
    func getAllSubviews<T: UIView>() -> [T] { return UIView.getAllSubviews(from: self) as [T] }
    func get<T: UIView>(all type: T.Type) -> [T] { return UIView.getAllSubviews(from: self) as [T] }
    func get(all types: [UIView.Type]) -> [UIView] { return UIView.getAllSubviews(from: self, types: types) }
    
    func startSkeleton() {
        let allViews = UIView.getAllSubviews(from: self)
        let initialliazeSkeleton = SekeletonView(views: allViews)
        initialliazeSkeleton.inittializeSkeleton()

    }
    
    func startAnimation() {
        setShapeLayer()
        self.layer.masksToBounds = true
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let mainColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        gradient.colors = [mainColor.cgColor,
                           mainColor.highlightColor(by: 0.93).cgColor,
                           mainColor.cgColor]
        self.layer.addSublayer(gradient)
        gradient.transition(direction: .leftRight)
        
    }
    
    func setShapeLayer() {
        let layer = CAShapeLayer()
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
        let allViews = UIView.getAllSubviews(from: self)
        let view = SekeletonView(views: allViews)
        view.stopSkeleton()
        
    }
    
}
