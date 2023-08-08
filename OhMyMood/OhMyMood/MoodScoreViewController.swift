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
  @IBOutlet weak var moreButton: UIButton!
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  // 뷰가 화면에 다시 나타날 때 데이터 적용
  // 다른 탭으로 갔다가 돌아왔을 때 데이터 새로고침
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    updateMoodScores()
    
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    updateMoodScores()
    setupMoodScoreViews()
    setupMoreButton()
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
  
  func setupMoreButton() {
    let resetAll = UIAction(title: "모두 초기화", attributes: .destructive, handler: { _ in MoodScoreManager.shared.resetScore()
      self.updateMoodScores()
    })
    let reset0 = UIAction(title: "완전행복지수 초기화", handler: { _ in
      MoodScoreManager.shared.resetScore(0)
      self.updateMoodScores()
    })
    let reset1 = UIAction(title: "적당미소지수 초기화", handler: { _ in
      MoodScoreManager.shared.resetScore(1)
      self.updateMoodScores()
    })
    let reset2 = UIAction(title: "그냥그냥지수 초기화", handler: { _ in
      MoodScoreManager.shared.resetScore(2)
      self.updateMoodScores()
    })
    let reset3 = UIAction(title: "좀속상한지수 초기화", handler: { _ in
      MoodScoreManager.shared.resetScore(3)
      self.updateMoodScores()
    })
    let reset4 = UIAction(title: "많이슬픈지수 초기화", handler: { _ in
      MoodScoreManager.shared.resetScore(4)
      self.updateMoodScores()
    })

    moreButton.menu = UIMenu(children: [resetAll, reset0, reset1, reset2, reset3, reset4])
  }
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods

}
