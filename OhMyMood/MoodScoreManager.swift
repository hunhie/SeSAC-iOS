//
//  MoodScoreManager.swift
//  OhMyMood
//
//  Created by walkerhilla on 2023/07/26.
//

import Foundation

// 과제를 위해서 열거형과 딕셔너리를 활용해보았으나 합리적인 적용은 아닌 듯..

// Mood 상태를 구분하는 열거형
enum Mood: Int {
  case happy
  case smile
  case soso
  case sad
  case bad
  
  // case를 String 타입으로 반환하는 연산 프로퍼티
  var getString: String {
    switch self {
    case .happy:
      return "happy"
    case .smile:
      return "smile"
    case .soso:
      return "soso"
    case .sad:
      return "sad"
    case .bad:
      return "bad"
    }
  }
}

// Mood 점수 매니저(싱글톤)
class MoodScoreManager {
  static let shared = MoodScoreManager()
  
  private init() {}
  
  // 데이터 저장 딕셔너리
  //var moodScoreDic: [Mood: Int] = [.happy: 0, .smile: 0, .soso: 0, .sad: 0, .bad: 0]
  
  // 감정 카운트 증가 메소드
  func increaseScore(_ mood: Int, _ number: Int = 1) {
    let key = Mood(rawValue: mood)!
    //self.moodScoreDic.updateValue(moodScoreDic[key]! + 1, forKey: key)
    
    // UserDefault에 저장된 값 불러오기, nil일 경우 0
    let value = (UserDefaults.standard.value(forKey: key.getString) as? Int) ?? 0
    
    // UserDefault에 새로운 값 저장
    UserDefaults.standard.setValue(value + number, forKey: key.getString)
  }
  
  // 감정 카운트 조회 메소드
  func getScore(_ mood: Int) -> Int {
    let key = Mood(rawValue: mood)!
    //return self.moodScoreDic[Mood(rawValue: mood)!]!
    
    // UserDefault에 저장된 값 반환
    return UserDefaults.standard.integer(forKey: key.getString)
  }
  
  // 감정 카운트 초기화 메소드
  func resetScore(_ mood: Int? = nil) {
    guard let tag = mood else {
      (0...4).forEach { tag in
        let key = Mood(rawValue: tag)!
        UserDefaults.standard.removeObject(forKey: key.getString)
      }
      return
    }
    let key = Mood(rawValue: tag)!
    UserDefaults.standard.removeObject(forKey: key.getString)
  }
}
