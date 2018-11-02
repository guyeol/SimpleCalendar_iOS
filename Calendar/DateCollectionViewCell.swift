//
//  DateCollectionViewCell.swift
//  Calendar
//
//  Created by 정구열 on 02/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var DateLabel: UILabel!
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.setCircularImageView()
  }
  
  func setCircularImageView() {
    self.DateLabel.layer.cornerRadius = self.DateLabel.frame.width/2
  }
}
