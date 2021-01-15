//
//  CAGradientLayer+Extensions.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit

public extension CAGradientLayer {
    
    private static let layerKey = "Skeleton.Animation"
    
    func transition(direction: GradientDirection, setGroupAnimation: ((CAAnimationGroup) -> Void) = { _ in }) {
        
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(startPoint))
        startPointAnim.apply(gradientTransition: direction.startPoint)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(endPoint))
        endPointAnim.apply(gradientTransition: direction.endPoint)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1
        animGroup.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animGroup.repeatCount = .infinity
        
        setGroupAnimation(animGroup)
        add(animGroup, forKey: CAGradientLayer.layerKey)
    }
    
    
    func stopTransition() {
        removeAnimation(forKey: CAGradientLayer.layerKey)
    }
}

