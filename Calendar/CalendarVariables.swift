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
let Months = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
var DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
var day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date)-1
var year = calendar.component(.year, from: date)

var selectedDay = calendar.component(.day, from: date)
var selectedMonth = calendar.component(.month, from: date)-1
var selectedYear = calendar.component(.year, from: date)
