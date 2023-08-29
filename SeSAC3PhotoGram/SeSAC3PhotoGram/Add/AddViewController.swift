//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/28.
//

import UIKit
import SeSAC3Framework

class AddViewController: BaseViewController {
  
  let mainView = AddView()
  
  override func loadView() {
    self.view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ClassOpenExample.publicExample()
    ClassPublicExample.publicExample()

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(_:)), name: NSNotification.Name("SelectImage"), object: nil)
    
    //sesacShowActivityViewCOntroller(image: UIImage(systemName: "star")!, url: "hello", text: "hi")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
  }
  
  @objc func selectImageNotificationObserver(_ notification: NSNotification) {
    guard let userInfo = notification.userInfo,
          let image = userInfo["name"] as? String else { return }
    mainView.photoImageView.image = UIImage(systemName: image)
    print(#function)
  }
  
  @objc func searchButtonTapped() {
    let vc = SearchViewController()
    vc.delegate = self
    present(vc, animated: true)
  }
  
  @objc func dateButtonTapped() {
    let vc = DateViewController()
    vc.delegate = self
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func searchProtocolButtonTapped() {
    let vc = SearchViewController()
    vc.delegate = self
    present(vc, animated: true)
  }
  
  @objc func titleButtonTapped() {
    let vc = TitleViewController()
    vc.completionHandler = { [weak self] text in
      guard let self else { return }
      print(text)
    }
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func contentButtonTapped() {
    let vc = ContentViewController()
    vc.completionHandler = { text in
      print(text)
    }
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func configureView() {
    super.configureView()
    
    mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    mainView.dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
    mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonTapped), for: .touchUpInside)
    mainView.titleButton.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
    mainView.contentButton.addTarget(self, action: #selector(contentButtonTapped), for: .touchUpInside)
  }
  
  override func setConstraints() {
    super.setConstraints()
  }
  
}

extension AddViewController: PassDataDelegate {
  func receiveData(image: String) {
    print(#function)
    mainView.photoImageView.image = UIImage(systemName: image)
  }
  
  
  func receiveData(date: Date) {
    mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
  }
}
