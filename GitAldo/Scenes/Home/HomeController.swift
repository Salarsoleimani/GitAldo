//
//  ViewController.swift
//  Clean Starter Project
//
//  Created by Salar Soleimani on 2020-04-21.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SSTools

class HomeController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var signInButton: UIButton!
  @IBOutlet weak var signInImageButton: UIImageView!
  // MARK:- Constants
  let signOutBarButton = UIBarButtonItem(title: "button_signout".localize(), style: .plain, target: nil, action: nil)
  
  // MARK:- Variables
  var viewModel: HomeViewModel!
  var disposeBag = DisposeBag()

  // MARK:- Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindViewModel()
  }
  
  // MARK:- Functions
  private func bindViewModel() {
    
  }
  // MARK:- Actions
}
