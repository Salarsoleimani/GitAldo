//
//  BranchsController.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import BEKListKit
import NetworkPlatform

class BranchsController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var branchsTableView: BEKMultiCellTable!

  // MARK:- Variables
  
  var navigator: BranchsNavigator?
  var branchUrl = ""

  // MARK:- LifeCycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    branchsTableView.delegate = self
    getBranchs()
    setupUI()
  }
  // MARK:- Fuctions
  func getBranchs() {
    NetworkManager.shared.fetchGenericDatas(urlString: branchUrl) { [navigator, setupTableView] (response: [Branch]?, err) in
      print("err when getting branchs: \(err)")
      if let response = response {
        DispatchQueue.main.async {
          setupTableView(response)
        }
      } else {
        DispatchQueue.main.async {
          navigator?.pop()
        }
      }
    }
  }
  private func setupTableView(_ branchs: [Branch]) {
    let viewModels = branchs.compactMap{$0.asBranchCellViewModel()}
    branchsTableView.push(cells: viewModels.compactMap{BEKGenericCell.Table<BranchCell>(viewModel: $0)})
  }
  // MARK:- Actions

  
}
extension BranchsController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}
