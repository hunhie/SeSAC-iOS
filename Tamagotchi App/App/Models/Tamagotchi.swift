//
//  Tamagotchi.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import Foundation

enum tamagotchiImagePath: String, Codable {
  case tingling = "1-"
  case smile = "2-"
  case sparkle = "3-"
}

struct Tamagotchi: Codable {
  static var level: Int {
    let quotient = (riceGrain/5 + waterDroplets/2) / 10
    return quotient > 0 ? quotient : 1
  }
  static var riceGrain: Int = 0
  static var waterDroplets: Int = 0
  
  let name: String
  let profileMessage: String
  let imagePath: tamagotchiImagePath
  
  var imagePathToString: String {
    imagePath.rawValue+"\(Self.level < 10 ? Self.level : 9)"
  }
  
  var defaultImagePathToString: String {
    imagePath.rawValue+"6"
  }
}

final class TamagotchiInfo {
  public static let shared = TamagotchiInfo()
  private init() {}
  
  var tamagotchis: [Tamagotchi] = [
    Tamagotchi(name: "따끔따끔 다마고치", profileMessage: """
               저는 따끔따끔 다마고치입니당~!
               뜨거운 햇살이 너무 더워요!! 이게 다 방실방실 다마고치 때문이에요.
               얼른 해가 졌으면 좋겠다..
               """, imagePath: .tingling),
    Tamagotchi(name: "방실방실 다마고치", profileMessage: """
               저는 방실방실 다마고치에요! 하늘을 밝게 빛나게 하는 역할을 맡고 있어요. 그런데, 따끔따끔 다마고치가 저를 싫어하는 것 같더라구요..
               가서 제 마음을 전해주실래요?
               """, imagePath: .smile),
    Tamagotchi(name: "반짝반짝 다마고치", profileMessage: """
               밤 하늘의 길잡이 역할을 맡고 있는 반짝반짝 다마고치에요.
               불가사리 아니에요...
               이래봬도 어엿한 별이라구요!
               """, imagePath: .sparkle),
  ]
}
