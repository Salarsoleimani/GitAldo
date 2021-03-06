//
//  SplashController.swift
//
//
//  Created by Behrad Kazemi on 11/25/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import UIKit
import Stellar

final class SplashController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var launchImage: UIImageView!
  @IBOutlet weak var logoLabel: UILabel!
  
  // MARK:- variables
  var viewModel: SplashViewModel!

  // MARK:- Constants

  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    assert(viewModel != nil)
    setupUI()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animation { [viewModel] in
      viewModel?.goToHomePage()
    }
  }
  // MARK:- Actions
  private func setupUI() {
    logoLabel.text = "app_name".localize()
    logoLabel.textColor = SSColors.text.value
    view.backgroundColor = SSColors.lightRed.value
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  // MARK:- Functions
  private func animation(completion: @escaping () -> ()){
    let startingScale = 1 - viewModel.scalePop
    let endingScale = 1 / startingScale
    
    launchImage.delay(1).scaleXY(startingScale, startingScale).duration(0.3).easing(.easeInEaseOut).completion { [launchImage] in
      AppSoundEffects().playPopSound()
      Vibrator.vibrate(hardness: 5)
      launchImage?.image = UIImage(named: "Logo")
    }.then().scaleXY(endingScale, endingScale).then().moveY(-60).snap(1).duration(1).animate()
    logoLabel.moveY(32).makeAlpha(1).duration(1).completion {
      completion()
    }.animate()
  }
}

