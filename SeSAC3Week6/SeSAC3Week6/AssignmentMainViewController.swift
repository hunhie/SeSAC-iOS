//
//  AssignmentMainViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit

class AssignmentMainViewController: UIViewController {
  
  lazy var buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fillEqually
    stackView.axis = .vertical
    stackView.spacing = 30
    
    (1...2).forEach { i in
      let button = UIButton()
      button.setTitle("Example \(i)", for: .normal)
      button.titleLabel?.font = .boldSystemFont(ofSize: 17)
      button.layer.cornerRadius = 20
      button.backgroundColor = .systemBlue
      button.clipsToBounds = true
      button.tag = i
      button.addTarget(self, action: #selector(signButtonTapped(_:)), for: .touchUpInside)
      stackView.addArrangedSubview(button)
    }
    
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    setupButtonStackView()
  }
  
  func setupButtonStackView() {
    view.addSubview(buttonStackView)
    buttonStackView.snp.makeConstraints { make in
      make.centerX.centerY.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.55)
      make.height.equalTo(view).multipliedBy(0.15)
    }
  }
  
  @objc func signButtonTapped(_ sender: UIButton) {
    let tag = sender.tag
    if tag == 1 {
      let vc = Example1ViewController()
      present(vc, animated: true)
    } else if tag == 2 {
      let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
      let sceneDelegate = windowScene?.delegate as? SceneDelegate
      let vc = Example2ViewController()
      sceneDelegate?.window?.rootViewController = vc
      sceneDelegate?.window?.makeKeyAndVisible()
    }
  }
}

