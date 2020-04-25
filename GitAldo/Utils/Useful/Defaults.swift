//
//  Defaults.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Domain
import RxCocoa

/// UserDefaults for Application layer
struct Defaults {
  @UserDefault(Constants.Keys.appOpenedCount.rawValue, defaultValue: 0)
  static var appOpenedCount: Int
  
  @UserDefault(Constants.Keys.isAdsRemoved.rawValue, defaultValue: false)
  static var isAdsRemoved: Bool
  
  @UserDefault(Constants.Keys.isOnboardingWatched.rawValue, defaultValue: true)
  static var isOnboardingWatched: Bool
  
  @UserDefault(Constants.Keys.fontScale.rawValue, defaultValue: 1.0)
  static var fontScale: Double
  
  @UserDefault(Constants.Keys.fontFamily.rawValue, defaultValue: "Montserrat")
  static var fontFamily: String
  
  @UserDefault(Constants.Keys.tokenString.rawValue, defaultValue: "")
  static var tokenString: String
  
  @UserDefault(Constants.Keys.tokenUrl.rawValue, defaultValue: "")
   static var tokenUrl: String
  
  @UserDefault(Constants.Keys.isLoggedIn.rawValue, defaultValue: false)
    static var isLoggedIn: Bool
}

let isLoggedIn = BehaviorRelay<Bool>(value: false)
