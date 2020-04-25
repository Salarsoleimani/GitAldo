//
//  PullRequestCell.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import BEKListKit

class PullRequestCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var numberLabel: UILabel!
  var viewModel: PullRequestViewModel?
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
extension PullRequestCell: BEKBindableCell {
  typealias ViewModelType = PullRequestViewModel
  
  func bindData(withViewModel viewModel: PullRequestViewModel) {
    self.viewModel = viewModel
    titleLabel.text = viewModel.title
    messageLabel.text = viewModel.message
    statusLabel.text = viewModel.status
    numberLabel.text = viewModel.number
  }
}
