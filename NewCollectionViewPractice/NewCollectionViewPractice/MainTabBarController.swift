//
//  MainTabBarController.swift
//  NewCollectionViewPractice
//
//  Created by walkerhilla on 2023/09/16.
//
import UIKit

final class MainTapBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTabBar()
  }
  
  func setupTabBar() {
    tabBar.backgroundColor = .systemBackground
    tabBar.isTranslucent = true
    
    let case1 = UINavigationController(rootViewController: Case1ViewController())
    let case2 = UINavigationController(rootViewController: Case2ViewController())
    setViewControllers([case1, case2], animated: true)
    
    if let items = tabBar.items {
      items[0].image = UIImage(systemName: "apple.logo")
      items[0].title = "집중 모드"
      
      items[1].image = UIImage(systemName: "message.fill")
      items[1].title = "설정"
    }
  }
}
