//
//  PullRequestsController.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import NetworkPlatform
import BEKListKit

class PullRequestsController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var pullReqsTableView: BEKMultiCellTable!
  // MARK:- Variables
  var repository: Repository?
  var navigator: PullRequestsNavigator?
  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    getPullReqs()
    navigationItem.title = "title_pullReqs".localize()

  }
  // MARK:- Functions
  private func getPullReqs() {
    let tokenConfig = TokenConfiguration(Defaults.tokenString, url: Defaults.tokenUrl)
    
    Octokit(tokenConfig).pullRequests(owner: repository?.owner.login ?? "", repository: repository?.name ?? "") { [setupTableView] (response) in
      switch response {
      case .success(let pullReqs):
        DispatchQueue.main.async {
          setupTableView(pullReqs)
        }
      case .failure(let err):
        print("error on get repos: \(err)")
        
      }
    }
  }
  private func setupTableView(_ pullReqs: [PullRequest]) {
    let viewModels = pullReqs.compactMap{$0.asPullRequestViewModel()}
    pullReqsTableView.push(cells: viewModels.compactMap{BEKGenericCell.Table<PullRequestCell>(viewModel: $0)})
  }
}
