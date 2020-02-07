//
//  AppDelegate.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let view = NoticeRouter.createModule() {
          let navigationController = UINavigationController.init(rootViewController: view)
          self.window?.rootViewController = navigationController
        }
        return true
    }

}

