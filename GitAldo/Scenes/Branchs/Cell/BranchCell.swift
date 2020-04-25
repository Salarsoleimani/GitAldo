//
//  BranchCell.swift
//  GitAldo
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import UIKit
import BEKListKit

class BranchCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var shaTitleLabel: UILabel!
  @IBOutlet weak var shaLabel: UILabel!

  var viewModel: BranchCellViewModel?

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
extension BranchCell: BEKBindableCell {
  typealias ViewModeltype = BranchCellViewModel
  func bindData(withViewModel viewModel: BranchCellViewModel) {
    self.viewModel = viewModel
    titleLabel.text = viewModel.title
    shaLabel.text = viewModel.sha
  }
}
