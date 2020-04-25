//
//  HomeNavigator.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Domain

final class HomeNavigator: Navigator {
  func setup() {
    let vc = HomeController.initFromNib()
    vc.viewModel = HomeViewModel(navigator: self)
    navigationController.setNavigationBarHidden(false, animated: true)
    navigationController.setViewControllers([vc], animated: true)
  }
  func toBranchs(branchUrl: String) {
    BranchsNavigator(navigationController: navigationController).setup(branchUrl)
  }
}
