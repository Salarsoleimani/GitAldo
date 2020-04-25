//
//  BranchNavigator.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

final class BranchsNavigator: Navigator {
  func setup(_ branchUrl: String) {
    let vc = BranchsController.initFromNib()
    vc.navigator = self
    vc.branchUrl = branchUrl
    navigationController.pushViewController(vc, animated: true)
  }
  func pop() {
    navigationController.popViewController(animated: true)
  }
}
