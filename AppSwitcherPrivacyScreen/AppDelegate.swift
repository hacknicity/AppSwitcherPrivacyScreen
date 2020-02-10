//
//  AppDelegate.swift
//  AppSwitcherPrivacyScreen
//
//  Created by Geoff Hackworth on 10/02/2020.
//  Copyright © 2020 Hacknicity. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UIApplication Lifecycle
    func applicationWillEnterForeground(_ application: UIApplication) {
        hidePrivacyProtectionWindow()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        showPrivacyProtectionWindow()
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: Privacy Protection
    private var privacyProtectionWindow: UIWindow?

    private func showPrivacyProtectionWindow() {
        privacyProtectionWindow = UIWindow(frame: UIScreen.main.bounds)
        privacyProtectionWindow?.rootViewController = PrivacyProtectionViewController()
        privacyProtectionWindow?.windowLevel = .alert + 1
        privacyProtectionWindow?.makeKeyAndVisible()
    }

    private func hidePrivacyProtectionWindow() {
        privacyProtectionWindow?.isHidden = true
        privacyProtectionWindow = nil
    }
}

