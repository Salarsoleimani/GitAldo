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
import BEKListKit
import NetworkPlatform

class HomeController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var signInButton: UIButton!
  @IBOutlet weak var signInImageButton: UIImageView!
  @IBOutlet weak var repositoriesTableView: BEKMultiCellTable!
  
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
    repositoriesTableView.delegate = self
  }

  // MARK:- Functions
  private func bindViewModel() {
    let input = HomeViewModel.Input(loginTrigger: signInButton.rx.tap.asDriver(), signOutTrigger: signOutBarButton.rx.tap.asDriver())
    let output = viewModel.transform(input: input)
    output.loginTrigger.drive(signInButton.rx.isHidden).disposed(by: disposeBag)
    output.loginTrigger.drive(signInImageButton.rx.isHidden).disposed(by: disposeBag)
    output.loginTrigger.asObservable().subscribe(onNext: { [navigationItem, signOutBarButton, repositoriesTableView, getRepositories] (loggedIn) in
      repositoriesTableView?.isHidden = !loggedIn
      if !loggedIn {
        navigationItem.rightBarButtonItems = nil
      } else {
        getRepositories()
        navigationItem.rightBarButtonItems = [signOutBarButton]
      }
    }).disposed(by: disposeBag)
  }
  private func getRepositories() {
    let tokenConfig = TokenConfiguration(Defaults.tokenString, url: Defaults.tokenUrl)

    Octokit(tokenConfig).repositories { [setupTableView] (repos) in
      switch repos {
      case .success(let repositories):
        DispatchQueue.main.async {
          setupTableView(repositories)
        }
      case .failure(let err):
        print("error on get repos: \(err)")
      }
    }
  }
  private func setupTableView(_ repositories: [Repository]) {
    let viewModels = repositories.compactMap{$0.asCellViewModel(self)}
    repositoriesTableView?.push(cells: viewModels.compactMap{BEKGenericCell.Table<RepositoryCell>(viewModel: $0)})
  }
  // MARK:- Actions
}
extension HomeController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 104
  }
}
extension HomeController: RepositoryCellDelegate {
  func didSelectBranchs(_ branchUrl: String) {
    viewModel.toBranchs(branchUrl: branchUrl)
  }
  
  func didSelectPullReqs(_ repository: RepositoryCellViewModel) {
    viewModel.toPullRequests(repository: repository)
  }
}
