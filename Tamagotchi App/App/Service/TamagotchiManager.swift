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
  
  func saveData(tamagotchi: Tamagotchi?) {
    UserDefaults.standard.setValue(User.shared.name, forKey: StringConstant.userName)
    UserDefaults.standard.setValue(Tamagotchi.riceGrain, forKey: StringConstant.tamagotchiRice)
    UserDefaults.standard.setValue(Tamagotchi.waterDroplets, forKey: StringConstant.tamagotchiWater)
    guard let tamagotchi else { return }
    if let encoded = try? JSONEncoder().encode(tamagotchi) {
      UserDefaults.standard.setValue(encoded, forKey: StringConstant.selectedTamagotchi)
    }
  }
  
  func loadData() -> Tamagotchi? {
    guard let savedData = UserDefaults.standard.data(forKey: StringConstant.selectedTamagotchi) else {
      return nil
    }
    
    let decoder = JSONDecoder()
    do {
      let savedObject = try decoder.decode(Tamagotchi.self, from: savedData)
      
      Tamagotchi.riceGrain = UserDefaults.standard.integer(forKey: StringConstant.tamagotchiRice)
      Tamagotchi.waterDroplets = UserDefaults.standard.integer(forKey: StringConstant.tamagotchiWater)
      
      return savedObject
    } catch {
      print("Error decoding Tamagotchi: \(error)")
      return nil
    }
  }
  
  func resetData() {
    Tamagotchi.resetData()
    UserDefaults.standard.setValue(false, forKey: "isLaunched")
    UserDefaults.standard.removeObject(forKey: StringConstant.selectedTamagotchi)
  }
}
