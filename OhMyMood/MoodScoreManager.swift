//
//  MoodScoreManager.swift
//  OhMyMood
//
//  Created by walkerhilla on 2023/07/26.
//

import Foundation

enum Mood {
  case happy
  case smile
  case soso
  case sad
  case bad
}

class MoodScoreManager {
  static let shared = MoodScoreManager()
  
  private init() {}
  
  var moodScore: [Mood: Int] = [.happy: 0, .smile: 0, .soso: 0, .sad: 0, .bad: 0]
  
  func increaseScore(_ mood: Mood) {
    self.moodScore.updateValue(moodScore[mood]! + 1, forKey: mood)
  }
  
  func getScore(_ mood: Mood) -> Int {
    return self.moodScore[mood]!
  }
}
