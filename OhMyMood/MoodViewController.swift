//
//  ViewController.swift
//  OhMyMood
//
//  Created by walkerhilla on 2023/07/25.
//

import UIKit

class MoodViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet var moods: [UIView]!
  @IBOutlet var emojis: [UIImageView]!
  
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    setupMoods()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
  }
  
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  @objc func moodTapped(_ sender: UITapGestureRecognizer) {
    if let tappedMood = sender.view {
      let moodTag = tappedMood.tag
      
      MoodScoreManager.shared.increaseScore(moodTag)
      
      let emoji = emojis[moodTag]
      // 애니메이션 효과를 위해 원래의 위치에서 약간 위로 올리고 다시 내려오는 애니메이션을 추가합니다.
      UIView.animate(withDuration: 0.2, animations: {
        emoji.transform = CGAffineTransform(translationX: 0, y: -10)
      }) { (_) in
        UIView.animate(withDuration: 0.2) {
          emoji.transform = .identity // 원래 위치로 돌아오는 애니메이션
        }
      }
    }
  }
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods
  
  private func setupMoods() {
    moods.forEach { mood in
      mood.isUserInteractionEnabled = true
      mood.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moodTapped(_:))))
    }
  }
}

