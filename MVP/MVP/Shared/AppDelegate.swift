//
//  AppDelegate.swift
//  MVP
//
//  Created by Ashish Awasthi on 22/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import UIKit
import iOSCoreDataConnect

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        if let viewController = ViewController.viewController(){
            let navigationController = UINavigationController.init(rootViewController: viewController)
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        DataManager.setUp(withDataModelName: "MVP", bundle: Bundle.main, persistentStoreName: "MVP")
        self.naviagtionBarSettings()
        return true
    }

    // MARK: UISceneSession Lifecycle

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

