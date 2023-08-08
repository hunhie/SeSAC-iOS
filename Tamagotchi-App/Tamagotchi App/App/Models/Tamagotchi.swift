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
  case eating
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
  
  static func statusMessage(type: MessageType) -> String? {
    let messageList: [MessageType: [String]] = [
      .common: [
          "\(User.shared.name)님, 과제는 다 하셨나요?",
          "오늘 날씨가 좋네요. \(User.shared.name)님의 동네도 화창한가요~?",
          "블로그 글은 매일 쓰고 계시나요? 나중에 \(User.shared.name)님 블로그 구경해볼게요!",
          "\(User.shared.name)님, 목이 너무 말라요. 물 주세요.",
          "\(User.shared.name)님, 이번 주에 어떤 계획이 있으신가요?",
          "오늘도 \(User.shared.name)님을 응원합니다!",
          "\(User.shared.name)님, 건강하세요! 항상 행운을 빕니다.",
          "힘내세요! 항상 응원할게요!"
      ],
      .eating: [
          "\(User.shared.name)님이 주시는거니까 맛있게 먹을게요.",
          "음?.. 좀 상한 것 같은데요?",
          "늦었잖아요.. 다음부터는 더 빨리 주세요.",
          "\(User.shared.name)님도 같이 먹어요!",
          "\(User.shared.name)님이 해주신 음식 최고에요!",
          "맛있어서 더 먹고 싶어요!",
          "오늘도 \(User.shared.name)님과 식사하는 건 행복해요!",
          "식사하러 가기 전부터 기대돼요!",
          "\(User.shared.name)님, 다음에는 제가 요리해볼게요. 기대해주세요!",
      ],
      .levelUp: [
          "\(User.shared.name)님 덕분에 레벨이 올랐어요! 이제 \(Tamagotchi.level)레벨이에요~~",
          "앗 레벨이 올랐어요! \(User.shared.name)님이 밥과 물을 잘 챙겨주신 덕분이에요.",
          "짜잔!! \(Tamagotchi.level)레벨로 올랐답니다!",
          "레벨업이에요! \(User.shared.name)님은 역시 다마고치 전문가!",
          "\(Tamagotchi.level)레벨로 올랐어요! 더 열심히 돌봐주실거죠?",
          "올라가는 레벨, 올라가는 기분! \n 얏호~ \(Tamagotchi.level)레벨!!",
          "\(User.shared.name)님이 있어서 더 열심히 살 수 있어요!",
          "다마고치를 키우는 \(User.shared.name)님은 정말 멋져요!",
          "우와, 이렇게 레벨업할 줄 몰랐어요!",
      ],
      .full: [
          "배가 불러서 더 이상 먹을 수 없어요..",
          "그만!.. 그만 주세요. 먹고 싶지 않아요!",
          "\(User.shared.name)님.. 저 배불러요!",
          "\(User.shared.name)님이나 많이 드세요.. 전 싫어요.",
          "오늘은 꽤 많이 먹은 것 같아요!",
          "\(User.shared.name)님이 대신 먹어주세요.",
          "배고파도 더 못 먹겠어요.. 정말 더 이상 먹을 수 없어요!",
          "맛있어 보이지만 배가 이미 꽉 찼어요."
      ]
  ]

    return messageList[type]?.randomElement()
  }
  
  static func tamagotchiAction(riceGrain: Int?, waterDroplets: Int?) -> MessageType {
    let level = Tamagotchi.level
    
    guard level < 10 else {
      return .full
    }
    
    Tamagotchi.riceGrain += riceGrain ?? 0
    Tamagotchi.waterDroplets += waterDroplets ?? 0
    
    return level != Tamagotchi.level ? .levelUp : .eating
  }
  
  static func resetData() {
    Tamagotchi.riceGrain = 0
    Tamagotchi.waterDroplets = 0
  }
  
  let name: String
  let introduceMessage: String
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
    Tamagotchi(name: "따끔따끔 다마고치", introduceMessage: """
               저는 따끔따끔 다마고치입니당~!
               뜨거운 햇살이 너무 더워요!! 이게 다 방실방실 다마고치 때문이에요.
               얼른 해가 졌으면 좋겠다..
               """, imagePath: .tingling),
    Tamagotchi(name: "방실방실 다마고치", introduceMessage: """
               저는 방실방실 다마고치에요! 하늘을 밝게 빛나게 하는 역할을 맡고 있어요. 그런데, 따끔따끔 다마고치가 저를 싫어하는 것 같더라구요..
               가서 제 마음을 전해주실래요?
               """, imagePath: .smile),
    Tamagotchi(name: "반짝반짝 다마고치", introduceMessage: """
               밤 하늘의 길잡이 역할을 맡고 있는 반짝반짝 다마고치에요.
               불가사리 아니에요...
               이래봬도 어엿한 별이라구요!
               """, imagePath: .sparkle),
  ]
}
