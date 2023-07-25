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
}

// Mood 점수 매니저(싱글톤)
class MoodScoreManager {
  static let shared = MoodScoreManager()
  
  private init() {}
  
  var moodScoreDic: [Mood: Int] = [.happy: 0, .smile: 0, .soso: 0, .sad: 0, .bad: 0]
  
  func increaseScore(_ mood: Int) {
    self.moodScoreDic.updateValue(moodScoreDic[Mood(rawValue: mood)!]! + 1, forKey: Mood(rawValue: mood)!)
  }
  
  func getScore(_ mood: Int) -> Int {
    return self.moodScoreDic[Mood(rawValue: mood)!]!
  }
}
