//
//  DailyViewController.swift
//  Calendar
//
//  Created by 정구열 on 03/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DailyViewController: UIViewController {
  
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var scheduleField: UITextView!
  
  var schedule: Results<Schedule>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dayLabel.text="\(year)년 \(month+1)월 \(day)일"
    let realm = RealmService.shared.realm
    schedule = realm.objects(Schedule.self)
  }
  
  @IBAction func addBtn(_ sender: Any) {
    AlertService.addAlert(in: self){ (title, detail) in
      let newSchedule = Schedule(year: year, month: month, day: day, title: title, detail: detail)
      RealmService.shared.create(newSchedule)
      print("\(year) \(month) \(day) \(title) \(detail!)")
    }
    
  }
  @IBAction func backBtn(_ sender: Any) {
    day-=1
    if day <= 0 {
      if month == 0 {
        month = 11
        year -= 1
      }
      month -= 1
      day = DaysInMonth[month]
    }
    dayLabel.text="\(year)년 \(month+1)월 \(day)일"
  }
  @IBAction func nextBtn(_ sender: Any) {
    day+=1
    if day > DaysInMonth[month] {
      if month == 11 {
        month = 0
        year += 1
      } else {
        month += 1
      }
      day = 1
    }
    dayLabel.text="\(year)년 \(month+1)월 \(day)일"
  }
  
  func fetch() {
    let realm = try! Realm()
    schedule = realm.objects(Schedule.self)
  }
}
