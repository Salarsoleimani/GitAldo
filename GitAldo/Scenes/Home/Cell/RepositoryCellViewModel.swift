//
//  RepositoryCellViewModel.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//
import UIKit
import NetworkPlatform

struct RepositoryCellViewModel {
  let delegate: RepositoryCellDelegate
  let model: Repository
  let title: String
  var typeImage: UIImage
  init(model: Repository, delegate: RepositoryCellDelegate) {
    self.delegate = delegate
    self.model = model
    self.title = model.name ?? ""
    self.typeImage = model.isPrivate ? #imageLiteral(resourceName: "ic_private") : #imageLiteral(resourceName: "ic_public")
    if model.isFork {
      self.typeImage = #imageLiteral(resourceName: "ic_forked")
    }
  }
}
