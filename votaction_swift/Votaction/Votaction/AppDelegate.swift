//
//  AppDelegate.swift
//  votaction
//
//  Created by Alexandre Marcos on 06/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: ConnectViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
