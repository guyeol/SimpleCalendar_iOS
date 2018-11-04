//
//  RealmService.swift
//  Calendar
//
//  Created by 정구열 on 04/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
  private init() {}
  static let shared = RealmService()
  
  var realm = try! Realm()
  
  func create<T: Object>(_ object: T) {
    do {
      try realm.write {
          realm.add(object)
        }
      } catch {
    }
  }
  
  func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
    do {
      try realm.write {
        for (key, value) in dictionary {
          object.setValue(value, forKey: key)
        }
      }
    } catch {
      
    }
  }
  
  func delete<T: Object> (_ object: T) {
    do {
      try realm.write {
        realm.delete(object)
      }
    } catch {
      
    }
  }
}
