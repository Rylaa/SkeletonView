//
//  UIView+CABasicAnimation.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit

extension CABasicAnimation {
  func apply(gradientTransition: GetGradientPoint) {
    fromValue = NSValue(cgPoint: gradientTransition.from)
    toValue = NSValue(cgPoint: gradientTransition.to)
  }
}


