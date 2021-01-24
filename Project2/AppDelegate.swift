//
//  AppDelegate.swift
//  Project2
//
//  Created by Guilherme Moraes on 22/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // (1)
        window = UIWindow(frame: UIScreen.main.bounds)
        // (2)
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        // (3)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

