//
//  ViewController.swift
//  Calendar
//
//  Created by 정구열 on 30/10/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  override func viewDidAppear(_ animated: Bool) {
    let mainTabController = storyboard?.instantiateViewController(withIdentifier: "CalendarTabController") as! CalendarTabController
    //첫 화면으로 띄울 탭 선택
    mainTabController.selectedViewController = mainTabController.viewControllers?[2]
    present(mainTabController, animated: true, completion: nil)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

