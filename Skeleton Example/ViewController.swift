//
//  ViewController.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 14.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var containerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        containerView.startSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
            self.containerView.stopSkeleton()
        }
    }
}


extension ViewController: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .startFlow }
}
