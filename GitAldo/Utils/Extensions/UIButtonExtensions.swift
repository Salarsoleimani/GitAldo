//
//  UIButtonExtensions.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit

extension UIButton {
  func makeNiceButton(_ backColor: UIColor = SSColors.buttonBackground.value) {
    //setTitleColor(SSColors.buttonText.value, for: .normal)
    tintColor = UIColor.white
    backgroundColor = backColor
    layer.cornerRadius = Constants.Sizes.cornerRadius
    let font = SSFonts(.installed(.montserrat, .bold), size: .standard(.h4)).instance
    titleLabel?.font = font
  }
}
