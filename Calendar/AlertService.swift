//
//  ScheduleAlertViewController.swift
//  Calendar
//
//  Created by 정구열 on 03/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class AlertService {
  static func addAlert(in vc: UIViewController, completion: @escaping (String, String?) -> Void) {
    let alert = UIAlertController(title: "새로운 스케쥴 추가", message: nil, preferredStyle: .alert)
    alert.addTextField {
      (titleTF) in titleTF.placeholder = "스케쥴 제목을 입력하세요(필수)"
    }
    alert.addTextField {
      (msgTF) in msgTF.placeholder = "스케쥴의 상세 내용을 입력하세요(선택)"
    }
    let action = UIAlertAction(title: "추가", style: .default) { (_) in
      guard let titleStr = alert.textFields?.first?.text,
      let msgStr = alert.textFields?.last?.text
        else {return}
      if titleStr == "" {
        print("제목을 입력하지 않음.")
      }
      let title = titleStr
      let message = msgStr == "" ? nil : msgStr
      completion(title, message)
    }
    alert.addAction(action)
    vc.present(alert, animated: true)
  }

  static func updateAlert(in vc: UIViewController, schedule: Schedule, completion: @escaping (String, String?) -> Void) {
    let alert = UIAlertController(title: "수정하기", message: nil, preferredStyle: .alert)
    alert.addTextField {
      (titleTF) in titleTF.placeholder = schedule.title
    }
    alert.addTextField {
      (msgTF) in msgTF.placeholder = schedule.detail
    }
    let action = UIAlertAction(title: "수정", style: .default) { (_) in
      guard let titleStr = alert.textFields?.first?.text,
        let msgStr = alert.textFields?.last?.text
        else {return}
      if titleStr == "" {
        print("제목을 입력하지 않음.")
      }
      let title = titleStr
      let message = msgStr == "" ? nil : msgStr
      completion(title, message)
    }
    alert.addAction(action)
    vc.present(alert, animated: true)
  }
}
