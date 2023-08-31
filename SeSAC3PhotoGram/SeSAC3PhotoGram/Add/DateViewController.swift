//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
  
  let mainView = DateView()
  
  var delegate: PassDataDelegate?
  
  override func loadView() {
    self.view = mainView
  }
  
  deinit {
    print("deinit: \(self)")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    delegate?.receiveData(date: mainView.picker.date)
  }
}
