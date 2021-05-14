//
//  TransactionDetailHeaderView.swift
//  Lunafi
//
//  Created by Yusuf Demirkoparan on 19.01.2021.
//  Copyright © 2021 Softtech. All rights reserved.
//

import UIKit

extension UIView {
    var nibContainerView: UIView {
        return self
    }
    
    func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}


import UIKit
protocol CustomViewProtocol  {
    var contentView: UIView! {get}
    func commonInit(for customViewName:String)
}

extension CustomViewProtocol where Self :UIView {
    func commonInit(for customViewName:String) {
        Bundle.main.loadNibNamed(customViewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
}



final class TransactionDetailHeaderView: UIView, CustomViewProtocol {
    
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet var contentView: UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit(for: nibName())
        
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.layer.borderWidth = 1
      
        let layer = CAShapeLayer()
        let layerPath: CGRect = CGRect(x: 0, y: 0, width: btn.frame.width, height: btn.frame.height)
        let path = UIBezierPath(roundedRect: layerPath, cornerRadius: 0)
        layer.fillColor = UIColor.blue.cgColor
        layer.path = path.cgPath
        btn.layer.addSublayer(layer)
        btn.layer.zPosition = 1
        btn.isUserInteractionEnabled = false
        
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit(for: nibName())
        
    }
    
    
}

