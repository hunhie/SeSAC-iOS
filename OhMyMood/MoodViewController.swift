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
      print(moodTag)
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

