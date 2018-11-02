//
//  MonthView.swift
//  Calendar
//
//  Created by 정구열 on 01/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation
import UIKit

protocol MonthViewDelegate: class {
  func didChangeMonth(MonthIndex: Int, year: Int)
}

class MonthView: UIView {
  var MonthArr = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
  var currentMonthIdx=0
  var currentYear=0
  var delegate: MonthViewDelegate?
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor=UIColor.clear
    currentMonthIdx=Calendar.current.component(.month, from: Date())
    
  }
}
