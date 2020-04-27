//
//  AppDelegate.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let trainProgressVC = TrainProgressVC()
        let nav = UINavigationController(rootViewController: trainProgressVC)
        
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

