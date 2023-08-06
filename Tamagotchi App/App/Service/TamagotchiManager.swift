//
//  TamagotchiManager.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/06.
//

import Foundation

final class TamagotchiManager {
  
  static let shared = TamagotchiManager()
  private init() {}
  
  func saveData(tamagotchi: Tamagotchi) {
    if let encoded = try? JSONEncoder().encode(tamagotchi) {
      UserDefaults.standard.setValue(encoded, forKey: StringConstant.selectedTamagotchi)
    }
  }
  
  func loadData() -> Tamagotchi? {
    if let savedData = UserDefaults.standard.object(forKey: StringConstant.selectedTamagotchi) as? Data {
      let decoder = JSONDecoder()
      if let savedObject = try? decoder.decode(Tamagotchi.self, from: savedData) {
        return savedObject
      }
    }
    return nil
  }
  
  func resetData() {
    Tamagotchi.resetData()
    UserDefaults.standard.setValue(false, forKey: "isLaunched")
    UserDefaults.standard.removeObject(forKey: StringConstant.selectedTamagotchi)
  }
}
