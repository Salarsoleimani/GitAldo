//
//  MainNavigationController.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit

final class MainNavigationController: UINavigationController {
  //MARK: - Initialization
  init() {
    super.init(rootViewController: UIViewController())
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
  }
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let attrs: [NSAttributedString.Key: Any] = [
      .foregroundColor: UIColor.white,
      .font: SSFonts(.installed(.montserrat, .bold), size: .standard(.h1)).instance
    ]
    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithOpaqueBackground()
      navBarAppearance.titleTextAttributes = attrs
      navBarAppearance.largeTitleTextAttributes = attrs
      navBarAppearance.backgroundColor = SSColors.yellow.value
      
      navigationBar.standardAppearance = navBarAppearance
      navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    navigationBar.backgroundColor = .brown
    //    self.setNavigationBarHidden(true, animated: false)
  }
}
