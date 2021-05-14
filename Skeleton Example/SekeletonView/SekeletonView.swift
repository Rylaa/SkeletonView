//
//  SekeletonView.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit
//
//final class SekeletonView {
//    
//    var views: [UIView]
//    
//    init(views: [UIView]) {
//        self.views = views
//    }
//}
//
//extension SekeletonView {
//    
//    func inittializeSkeleton() {
//        views.removeAll(where: { $0.classForCoder.class().description() == "UIView" })
//        views.removeAll(where: { $0.classForCoder.class().description() == "UIStackView" })
//        views.forEach({ val in
//            val.startAnimation()
//            if let btn = val as? UIButton {
//                btn.titleLabel?.isHidden = true
//                btn.layer.borderWidth = 0
//            }
//        })
//    }
//    
//    func stopSkeleton() {
//        views.forEach { val in
//            val.layer.sublayers?.forEach { layer in
//                if let gradientLayer = layer as? CAGradientLayer {
//                    gradientLayer.stopSliding()
//                    gradientLayer.removeFromSuperlayer()
//                }
//                
//                if let shapeLayer = layer as? CAShapeLayer {
//                    shapeLayer.removeFromSuperlayer() 
//                }
//            }
//            
//            if let btn = val as? UIButton {
//                btn.titleLabel?.isHidden = false
//                
//            }
//        }
//    }
//    
//    
//}
//
//
//extension UIButton {
//    
//    
//    
//    func getTemplateButton() {
//        
//    }
//    
//}
