//
//  SekeletonView.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit

final class SekeletonView {
    
    var views: [UIView]
    
    init(views: [UIView]) {
        self.views = views
    }
}

extension SekeletonView {
    
    func inittializeSkeleton() {
        views.removeAll(where: { $0.classForCoder.class().description() == "UIView" })
        views.forEach({ val in
            val.startAnimation()
            
        })
    }
    
    func stopSkeleton() {
        views.forEach { val in
            val.layer.sublayers?.forEach { layer in
                if let gradientLayer = layer as? CAGradientLayer {
                    gradientLayer.stopTransition()
                    gradientLayer.removeFromSuperlayer()
                }
                
                if let shapeLayer = layer as? CAShapeLayer {
                    shapeLayer.removeFromSuperlayer()
                    
                }
            }
        }
    }
}

