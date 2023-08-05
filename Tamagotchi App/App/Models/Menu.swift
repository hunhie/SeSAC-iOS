//
//  Menu.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/05.
//

import Foundation

enum MenuType {
  case alert
  case push(String)
}

struct Menu {
  let name: String
  let image: String
  var detail: String?
  let type: MenuType
}
