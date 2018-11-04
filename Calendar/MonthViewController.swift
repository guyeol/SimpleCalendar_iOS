//
//  MonthView.swift
//  Calendar
//
//  Created by 정구열 on 01/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var Calendar: UICollectionView!
  @IBOutlet weak var MonthLabel: UILabel!
  
  let Months = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
  let DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
  
  var curMonth = String()
  var numOfEmptyBoxes = Int()
  var nextNumOfEmptyBoxes = Int()
  var prevNumOfEmptyBoxes = 0
  var direction = 0
  var positionIdx = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    curMonth = Months[month]
    MonthLabel.text = "\(year)년 \(curMonth)"
    getStartDateDayPosition()
  }
  
  @IBAction func BackBtn(_ sender: Any) {
    switch curMonth {
    case "1월":
      month = 11
      year -= 1
      direction = -1
      getStartDateDayPosition()
      curMonth = Months[month]
      MonthLabel.text = "\(year)년 \(curMonth)"
      Calendar.reloadData()
    default:
      month -= 1
      direction = -1
      getStartDateDayPosition()
      curMonth = Months[month]
      MonthLabel.text = "\(year)년 \(curMonth)"
      Calendar.reloadData()
    }
  }
  
  @IBAction func NextBtn(_ sender: Any) {
    switch curMonth {
    case "12월":
      month = 0
      year += 1
      direction = 1
      getStartDateDayPosition()
      curMonth = Months[month]
      MonthLabel.text = "\(year)년 \(curMonth)"
      Calendar.reloadData()
    default:
      direction = 1
      getStartDateDayPosition()
      month += 1
      curMonth = Months[month]
      MonthLabel.text = "\(year)년 \(curMonth)"
      Calendar.reloadData()
    }
  }
  
  func getStartDateDayPosition() {
    switch direction {
    case 0:
      switch day {
      case 1...7:
        numOfEmptyBoxes = weekday - day
      case 8...14:
        numOfEmptyBoxes = weekday - day - 7
      case 15...21:
        numOfEmptyBoxes = weekday - day - 14
      case 22...28:
        numOfEmptyBoxes = weekday - day - 21
      case 29...31:
        numOfEmptyBoxes = weekday - day - 28
      default:
        break
      }
      positionIdx = numOfEmptyBoxes
    case 1:
      nextNumOfEmptyBoxes = (positionIdx + DaysInMonth[month])%7
      positionIdx = nextNumOfEmptyBoxes
    case -1:
      prevNumOfEmptyBoxes = (7 - (DaysInMonth[month] - positionIdx)%7)
      if(prevNumOfEmptyBoxes == 7) {
        prevNumOfEmptyBoxes = 0
      }
      positionIdx = prevNumOfEmptyBoxes
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch direction {
    case 0:
      return DaysInMonth[month] + numOfEmptyBoxes
    case 1:
      return DaysInMonth[month] + nextNumOfEmptyBoxes
    case -1:
      return DaysInMonth[month] + prevNumOfEmptyBoxes
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
    cell.backgroundColor = UIColor.clear
    cell.layer.cornerRadius = cell.frame.width/2
    cell.layer.masksToBounds = true
    if cell.isHidden {
      cell.isHidden = false
    }
    switch direction {
    case 0:
      cell.DateLabel.text = "\(indexPath.row + 1 - numOfEmptyBoxes)"
    case 1:
      cell.DateLabel.text = "\(indexPath.row + 1 - nextNumOfEmptyBoxes)"
    case -1:
      cell.DateLabel.text = "\(indexPath.row + 1 - prevNumOfEmptyBoxes)"
    default:
      return cell
    }
    
    switch indexPath.row {
    case 6,7,13,14,20,21,27,28,34,35:
      cell.DateLabel.textColor = UIColor.lightGray
    default:
      cell.DateLabel.textColor = UIColor.black
    }
 
    if Int(cell.DateLabel.text!)! < 1 {
      cell.isHidden = true
    }
    
    if curMonth == Months[calendar.component(.month, from: date)-1] && year == calendar.component(.year, from: date) && day == Int(cell.DateLabel.text!) {
      cell.backgroundColor = UIColor.init(red: 0xEB, green: 0x14, blue: 0x14)
      cell.DateLabel.textColor = UIColor.white
    }
    
    return cell
  }
  
}
