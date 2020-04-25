//
//  UIViewExtensions.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit

extension UIView {
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    //layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    
    //    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    //    layer.shouldRasterize = true
    //    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1
    
    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
