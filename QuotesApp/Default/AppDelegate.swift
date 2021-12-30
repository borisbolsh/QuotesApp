//
//  AppDelegate.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 29.12.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = QuotesRouter.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

