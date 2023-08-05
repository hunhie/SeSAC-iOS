//
//  Tamagotchi.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import Foundation

enum TamagotchiType: String, Codable {
  case tingling
  case smile
  case sparkle
  
  var imagePath: String {
    switch self {
    case .tingling:
      return "1-"
    case .smile:
      return "2-"
    case .sparkle:
      return "3-"
    }
  }
}

enum MessageType {
  case common
  case levelUp
  case full
}

struct Tamagotchi: Codable {
  static var level: Int {
    let quotient = (riceGrain/5 + waterDroplets/2) / 10
    return quotient > 0 ? quotient : 1
  }
  static var riceGrain: Int = 0
  static var waterDroplets: Int = 0
  static let statusMessage: [MessageType: [String]] = [
    .common : [
      "\(User.shared.name)님 과제는 다 하신거에요?",
      "날씨가 좋네요. \n \(User.shared.name)님 동네도 화창한가요~?",
      "블로그 글은 매일 쓰고 계신가요? \n 나중에 \(User.shared.name)님 블로그 구경해볼래요!",
      "\(User.shared.name)님 목이 너무 말라요. 물 주세요",
    ],
    .levelUp : [
      "\(User.shared.name)님 덕분에 레벨이 올랐어요! \n 이제 \(Self.level)레벨이에요~~",
      "앗 레벨이 올랐어요!n \(User.shared.name)님이 밥과 물을 잘 챙겨주신 덕분이에요.",
      "짜잔!! \(Self.level)레벨로 올랐답니다!"
    ],
    .full : [
    "배가 불러서 더 이상 먹을 수 없어요..",
    "그만!.. 그만 주세요. 먹고 싶지 않아요!",
    "\(User.shared.name)님.. 저 배불러요!"
    ]
  ]
  
  let name: String
  let profileMessage: String
  let imagePath: TamagotchiType
  
  var imagePathToString: String {
    imagePath.imagePath+"\(Self.level < 10 ? Self.level : 9)"
  }
  
  var defaultImagePathToString: String {
    imagePath.imagePath+"6"
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
