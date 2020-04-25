//
//  RepositoryCell.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import BEKListKit

protocol RepositoryCellDelegate: class {
  func didSelectBranchs(_ branchUrl: String)
  func didSelectPullReqs(_ repository: RepositoryCellViewModel)
}
class RepositoryCell: UITableViewCell {
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var typeImageView: UIImageView!
  
  @IBOutlet weak var brancsButton: UIButton!
  @IBOutlet weak var pullRequestsButton: UIButton!

  var viewModel: RepositoryCellViewModel?
  weak var delegate: RepositoryCellDelegate?
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.dropShadow()
    brancsButton.makeNiceButton()
    pullRequestsButton.makeNiceButton()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  @IBAction private func didSelectBranchs(_ sender: UIButton) {
    delegate?.didSelectBranchs(viewModel?.model.branchUrl?.replacingOccurrences(of: "{/branch}", with: "") ?? "")
  }
  @IBAction private func didSelectPullReqs(_ sender: UIButton) {
    if let vm = viewModel {
      delegate?.didSelectPullReqs(vm)
    }
  }
  
}

extension RepositoryCell: BEKBindableCell {
  typealias ViewModeltype = RepositoryCellViewModel
  func bindData(withViewModel viewModel: RepositoryCellViewModel) {
    self.viewModel = viewModel
    self.delegate = viewModel.delegate
    titleLabel.text = viewModel.title
    typeImageView.image = viewModel.typeImage
  }
}

