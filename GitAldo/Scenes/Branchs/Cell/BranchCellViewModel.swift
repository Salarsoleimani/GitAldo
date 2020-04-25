//
//  BranchCellViewModel.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import NetworkPlatform

struct BranchCellViewModel {
  let model: Branch
  let title: String
  var sha: String
  
  init(model: Branch) {
    self.model = model
    self.title = model.name
    self.sha = model.commit.sha
  }
}
extension Branch {
  func asBranchCellViewModel() -> BranchCellViewModel {
    return BranchCellViewModel(model: self)
  }
}
