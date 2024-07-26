//
//  User.swift
//  Appetizers
//
//  Created by Nikita Alexander on 07/06/2024.
//

import Foundation

struct User: Codable {
  var firstName: String = ""
  var lastName: String = ""
  var email: String = ""
  var birthday: Date = Date()
  var extraNapkins: Bool = false
  var frequentRefills: Bool = false
}
