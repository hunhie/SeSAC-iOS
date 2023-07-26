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
  @IBOutlet var moodButtons: [UIButton]!
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    setupButtonPullDownMenu()
  }
  
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  @IBAction func moodTapped(_ sender: UIButton) {
    let moodTag = sender.tag
    print(moodTag)
    MoodScoreManager.shared.increaseScore(moodTag)
    
    let emoji = emojis[moodTag]
    
    // 애니메이션 효과를 위해 원래의 위치에서 약간 위로 올리고 다시 내려오는 애니메이션을 추가합니다.
    UIView.animate(withDuration: 0.2, animations: {
      emoji.transform = CGAffineTransform(translationX: 0, y: -10)
    }) { _ in
      UIView.animate(withDuration: 0.2) {
        emoji.transform = .identity // 원래 위치로 돌아오는 애니메이션
      }
    }
  }
  
  func setupButtonPullDownMenu() {
    moodButtons.forEach { button in
      let plus1 = UIAction(title: "+1", image: nil, handler: { _ in MoodScoreManager.shared.increaseScore(button.tag) })
      let plus3 = UIAction(title: "+3", image: nil, handler: { _ in MoodScoreManager.shared.increaseScore(button.tag, 3) })
      let plus5 = UIAction(title: "+5", image: nil, handler: { _ in MoodScoreManager.shared.increaseScore(button.tag, 5) })
      let plus10 = UIAction(title: "+10", image: nil, handler: { _ in MoodScoreManager.shared.increaseScore(button.tag, 10) })
      button.menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [plus1, plus3, plus5, plus10])
    }
  }
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods
  
}
