//
//  TableViewCell.swift
//  Calendar
//
//  Created by 정구열 on 03/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  

  @IBOutlet weak var DateLabel: UILabel!
  @IBOutlet weak var TextField: UITextField!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
      
    }
}
