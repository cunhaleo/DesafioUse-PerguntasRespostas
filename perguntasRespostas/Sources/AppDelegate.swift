//
//  AppDelegate.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 17/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let inicioViewController = StartViewController()
        let navigationController = UINavigationController(rootViewController: inicioViewController)
         
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

