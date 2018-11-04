//
//  Schedule.swift
//  Calendar
//
//  Created by 정구열 on 03/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Schedule: Object{
  dynamic var year: Int = 0
  dynamic var month: Int = 0
  dynamic var day: Int = 0
  dynamic var title: String = ""
  dynamic var detail: String?
  dynamic var isEnrolled: Bool?
  
  convenience init (year: Int, month: Int, day: Int, title: String, detail: String?) {
    self.init()
    self.year = year
    self.month = month
    self.day = day
    self.title = title
    self.detail = detail
  }
}
