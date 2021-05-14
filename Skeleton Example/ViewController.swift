//
//  ViewController.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 14.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headers: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var containerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.isDisableSkeleton = true
        view.startSkeleton()
      
        
    }
}


extension ViewController: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .startFlow }
}
