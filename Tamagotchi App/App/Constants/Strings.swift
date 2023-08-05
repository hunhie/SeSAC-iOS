//
//  strings.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import Foundation

/// String Constants
enum StringConstant {
  
  // select Screen
  static let tamagotchiSelectTitle = "다마고치 선택하기"
  static let tamagotchiPreparing = "준비중이에요"
  
  // mainScreen
  static let yourTamagotchi = "님의 다마고치"
  static let eating = "밥먹기"
  static let drinking = "물먹기"
  static let riceGrain = "밥알"
  static let waterDroplets = "물방울"
  
  // settings
  static let setting = "설정"
  static let setName = "내 이름 설정하기"
  static let changeTamagotchi = "다마고치 변경하기"
  static let reset = "데이터 초기화"
  
  // set name Screen
  static let setNameTitle = "님 이름 정하기"
  
  // reset Screen
  static let resetAlertTitle = "데이터 초기화"
  static let resetAlertMessage = "정말 다시 처음부터 시작하실거에요?"
  
  // UserDefault Identifier
  static let selectedTamagotchi = "selectedTamagotchi"
  
  // Main Screen Image Path
  static let bubble = "bubble"
  static let noImage = "noImage"
}
