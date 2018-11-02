//
//  CalendarVariables.swift
//  Calendar
//
//  Created by 정구열 on 02/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current
var day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date)-1
var year = calendar.component(.year, from: date)
