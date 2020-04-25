//
//  PullRequestViewModel.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import NetworkPlatform

struct PullRequestViewModel {
  let model: PullRequest
  let number: String
  let title: String
  let message: String
  let status: String
  
  init(model: PullRequest) {
    self.model = model
    switch model.state {
      case .Open:
        self.status = "Status: Pending"
      case .Closed:
        self.status = "Status: Rejected"
      case .All:
        self.status = "Status: Approved"
      case .none:
        self.status = "Status: None"
        print("none model state")
    }
    self.number = "Number: " + String(model.number)
    self.title = model.title ?? ""
    self.message = model.body ?? ""
  }
}
extension PullRequest {
  func asPullRequestViewModel() -> PullRequestViewModel {
    return PullRequestViewModel(model: self)
  }
}
