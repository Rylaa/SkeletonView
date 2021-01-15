//
//  SkeletonGradientLayer.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit

final class SkeletonGradientLayer: CAGradientLayer {
    
    var view: UIView
    
    init(view: UIView) {
        super.init(layer: view)
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


