//
//  CalendarViewController.swift
//  Calendar
//
//  Created by 정구열 on 01/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation
import UIKit

class CalendarTabController: UITabBarController{
  
  @IBOutlet weak var TabBar: UITabBar!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    UITabBar.appearance().tintColor = UIColor.init(red: 0xEB, green: 0x14, blue: 0x14)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
