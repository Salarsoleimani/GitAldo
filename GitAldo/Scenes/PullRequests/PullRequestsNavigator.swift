//
//  PullRequestsNavigator.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Foundation

final class PullRequestsNavigator: Navigator {
  func setup(_ repository: RepositoryCellViewModel) {
    let vc = PullRequestsController.initFromNib()
    vc.repository = repository.model
    vc.navigator = self
    navigationController.pushViewController(vc, animated: true)
  }
  func pop() {
    navigationController.popViewController(animated: true)
  }
}
