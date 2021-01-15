//
//  CAGradientLayer+Extensions.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit

public extension CAGradientLayer {
    
    private static let layerKey = "Skeleton.Animation"
    
    func transition(to dir: GradientDirection, group: ((CAAnimationGroup) -> Void) = { _ in }) {
        
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(startPoint))
        startPointAnim.apply(gradientTransition: dir.startPoint)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(endPoint))
        endPointAnim.apply(gradientTransition: dir.endPoint)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1
        animGroup.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animGroup.repeatCount = .infinity
        
        group(animGroup)
        add(animGroup, forKey: CAGradientLayer.layerKey)
    }
    
    
    func stopSliding() {
        removeAnimation(forKey: CAGradientLayer.layerKey)
    }
}

