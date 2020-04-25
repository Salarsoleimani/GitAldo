//
//  HomeControllerUI.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit

extension HomeController {
  func setupUI() {
    navigationItem.title = "app_name".localize()
    
    view.backgroundColor = SSColors.background.value
    setSignInButtonUI()


  }
  private func setSignInButtonUI() {
    let title = "button_login_github".localize()
    signInButton.setTitle(title, for: .normal)
    setSignInButtonImage()
  }
  private func setSignInButtonImage() {
    signInButton.makeNiceButton()

    if #available(iOS 12.0, *) {
      let signInImage = traitCollection.userInterfaceStyle == .light ? #imageLiteral(resourceName: "ic_github_logo_light") : #imageLiteral(resourceName: "ic_github_logo_dark")
      signInImageButton.image = signInImage
    } else {
      signInImageButton.image = #imageLiteral(resourceName: "ic_github_logo_light")
    }
  }
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    DispatchQueue.main.async { [setSignInButtonImage] in
      setSignInButtonImage()
    }
  }
}

