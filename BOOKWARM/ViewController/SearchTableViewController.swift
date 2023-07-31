//
//  SearchTableViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

class SearchTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setBackButton()
  }
  
  func setBackButton() {
    let back = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(back))
    back.tintColor = .black
    self.navigationItem.leftBarButtonItem = back
  }
  
  @objc func back() {
    dismiss(animated: true)
  }
  // MARK: - Table view data source
  
  
  
}
