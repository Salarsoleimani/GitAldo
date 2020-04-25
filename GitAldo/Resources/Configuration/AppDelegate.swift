//
//  AppDelegate.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import NetworkPlatform

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var config: OAuthConfiguration?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    setupApplication()
    return true
  }
  private func setupApplication() {
    Application.shared.configureMainInterface(in: window)
    Application.shared.setupApplicationConfigurations()
  }
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if let code = url.URLParameters["code"] {
      self.config?.authorize(code: code, completion: { (configs) in
        Defaults.tokenUrl = configs.apiEndpoint
        Defaults.tokenString = configs.accessToken ?? ""
        Defaults.isLoggedIn = true
        isLoggedIn.accept(true)
      })
    }
    return false
  }
}
