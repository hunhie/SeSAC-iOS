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
  
  static func MenuList() -> [Menu] {
    return [
      Menu(name: "내 이름 설정하기", image: "pencil", detail: User.shared.name, type: .push(SettingNameViewController.identifier)),
      Menu(name: "다마고치 변경하기", image: "moon.fill", type: .push(TamagotchiSelectViewController.identifier)),
      Menu(name: "데이터 초기화", image: "arrow.clockwise", type: .alert)
    ]
  }
}
