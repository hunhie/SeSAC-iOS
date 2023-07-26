//
//  MoodScoreViewController.swift
//  OhMyMood
//
//  Created by walkerhilla on 2023/07/26.
//

import UIKit

class MoodScoreViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet var moodScoreViews: [UIView]!
  @IBOutlet var moodScoreLabels: [UILabel]!
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  // 뷰가 화면에 다시 나타날 때 데이터 적용
  // 다른 탭으로 돌아갔다가 돌아왔을 때 데이터 새로고침
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    updateMoodScores()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    updateMoodScores()
    setupMoodScoreViews()
  }
  
  func updateMoodScores() {
    moodScoreLabels.forEach { label in
      label.text = String(MoodScoreManager.shared.getScore(label.tag)) + "점"
    }
  }
  
  func setupMoodScoreViews() {
    moodScoreViews.forEach { view in
      view.layer.cornerRadius = 8
      view.clipsToBounds = true
    }
  }
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods

}
