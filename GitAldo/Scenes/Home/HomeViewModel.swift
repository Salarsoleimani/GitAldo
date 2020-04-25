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
import SSTools
import SafariServices


final class HomeViewModel: ViewModelType {
  let disposeBag = DisposeBag()
  private let navigator: HomeNavigator
  var config = (UIApplication.shared.delegate as! AppDelegate).config

  init(navigator: HomeNavigator) {
    self.navigator = navigator
  }
  func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
    let signoutTriggered = input.signOutTrigger
    isLoggedIn.accept(Defaults.isLoggedIn)
    input.loginTrigger.drive(onNext: { [unowned self] () in
      self.config = OAuthConfiguration(token: "08b75e01f071ddae21be", secret: "30c3b38645f528574f12cc7ddb746f7ae29725ec", scopes: ["repo", "read:org"])
      (UIApplication.shared.delegate as! AppDelegate).config = self.config
      let url = self.config?.authenticate()
      UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }).disposed(by: disposeBag)
    signoutTriggered.drive(onNext: { () in
      Defaults.isLoggedIn = false
      Defaults.tokenString = ""
      Defaults.tokenUrl = ""
      isLoggedIn.accept(false)
    }).disposed(by: disposeBag)
    return Output(loginTrigger: isLoggedIn.asDriver(), signOutTrigger: signoutTriggered)
  }
  func toBranchs(branchUrl: String) {
    navigator.toBranchs(branchUrl: branchUrl)
  }
  func toPullRequests(repository: RepositoryCellViewModel) {
    
  }
  
}
extension HomeViewModel {
  struct Input {
    let loginTrigger: Driver<Void>
    let signOutTrigger: Driver<Void>
  }
  struct Output {
    let loginTrigger: Driver<Bool>
    let signOutTrigger: Driver<Void>
  }
}
