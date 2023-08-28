//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {
  
  let mainView = AddView()
  
  override func loadView() {
    self.view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(_:)), name: NSNotification.Name("SelectImage"), object: nil)
  }
  
  @objc func selectImageNotificationObserver(_ notification: NSNotification) {
    guard let userInfo = notification.userInfo,
          let image = userInfo["name"] as? String else { return }
    mainView.photoImageView.image = UIImage(systemName: image)
    print(#function)
  }
  
  @objc func searchButtonTapped() {
    let vc = SearchViewController()
    present(vc, animated: true)
  }
  
  override func configureView() {
    super.configureView()
    
    mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
  }
  
  override func setConstraints() {
    super.setConstraints()
  }
  
}

