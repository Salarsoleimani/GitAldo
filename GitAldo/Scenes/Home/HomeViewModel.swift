//
//  HomeViewModel.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa
import NetworkPlatform

final class HomeViewModel: ViewModelType {
  private let navigator: HomeNavigator
  
  init(navigator: HomeNavigator) {
    self.navigator = navigator
  }
  func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
    let isLoggedIn = BehaviorRelay<Bool>(value: false)
    let config = OAuthConfiguration(token: "08b75e01f071ddae21be", secret: "30c3b38645f528574f12cc7ddb746f7ae29725ec", scopes: ["repo", "read:org"])
    let url = config.authenticate()
    return Output(loginTrigger: isLoggedIn.asDriver())
  }
}
extension HomeViewModel {
  struct Input {
    let loginTrigger: Driver<Void>
  }
  struct Output {
    let loginTrigger: Driver<Bool>
  }
}
