//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/31.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
  func didSelectItemAt(indexPath: IndexPath)
}

class HomeViewController: BaseViewController, HomeViewProtocol {
  
  func didSelectItemAt(indexPath: IndexPath) {
    dismiss(animated: true)
  }
  
  deinit {
    print(#function)
  }
  
  override func loadView() {
    let view = HomeView()
    view.delegate = self
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
