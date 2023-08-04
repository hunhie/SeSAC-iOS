//
//  Tamagotchi.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import Foundation

enum tamagotchiImagePath: String {
  case tingling = "1-"
  case smile = "2-"
  case sparkle = "3-"
}

struct Tamagotchi {
  let name: String
  let profileMessage: String
  var level: Int
  var riceGrain: Int
  var waterDroplets: Int
  let imagePath: tamagotchiImagePath
  
  var imagePathToString: String {
    imagePath.rawValue+"\(level < 10 ? level : 9)"
  }
}

final class TamagotchiInfo {
  public static let shared = TamagotchiInfo()
  private init() {}
  
  var tamagotchis: [Tamagotchi] = [
    Tamagotchi(name: "따끔따끔 다마고치", profileMessage: """
               저는 따끔따끔 다마고치입니당~!
               절 만지면 손에 구멍이 뻥뻥 뚫릴지도 몰라요.
               하루종일 뜨거운 햇빛을 받아서 너무 덥네요!! 이게 다 방실방실 다마고치 때문이에요.
               얼른 해가 졌으면 좋겠다..
               """, level: 1, riceGrain: 0, waterDroplets: 0, imagePath: .tingling),
    Tamagotchi(name: "방실방실 다마고치", profileMessage: """
               저는 방실방실 다마고치에요! 하늘을 밝게 빛나게 하는 역할을 맡고 있어요. 그런데, 따끔따끔 다마고치가 저를 싫어하는 것 같더라구요..
               가서 제 마음을 전해주실래요?
               """, level: 1, riceGrain: 0, waterDroplets: 0, imagePath: .smile),
    Tamagotchi(name: "반짝반짝 다마고치", profileMessage: """
               밤 하늘의 길잡이 역할을 맡고 있는 반짝반짝 다마고치에요.
               불가사리 아니에요...
               이래봬도 어엿한 별이라구요!
               """, level: 1, riceGrain: 0, waterDroplets: 0, imagePath: .sparkle),
  ]
}
