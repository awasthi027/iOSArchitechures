//
//  AppDelegate.swift
//  MVVM
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import UIKit
import iOSCoreDataConnect
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        if let viewController = NoticeViewController.noticeViewController(){
            let navigationController = UINavigationController.init(rootViewController: viewController)
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        DataManager.setUp(withDataModelName: "MVVM", bundle: Bundle.main, persistentStoreName: "MVVM")
        self.naviagtionBarSettings()
        return true
    }

   

}

extension AppDelegate {
    
    func naviagtionBarSettings() {
        let app = UINavigationBar.appearance()
        app.isTranslucent = false
        app.barTintColor = .themeColor
        app.tintColor = .navigationTitleColor//
        if let fontItem =  UIFont.baseThemeMediumFont(size: 16.0) {
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: fontItem]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationTitleColor]
        }
    }
}
