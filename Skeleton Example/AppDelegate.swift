//
//  AppDelegate.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 14.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController.instantiate()
        window?.makeKeyAndVisible()
        return true
    }
}



