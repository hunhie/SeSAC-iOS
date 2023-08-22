//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit
import SnapKit

class Example2ViewController: UIViewController {
  
  // 배경이미지
  lazy var backgroundImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "bg")
    view.layer.opacity = 0.55
    view.contentMode = .scaleAspectFill
    return view
  }()
  
  // 상단 툴바 뷰
  lazy var toolbarView: UIView = {
    let view = UIView()
    view.addSubview(toolbarCloseButton)
    view.addSubview(toolbarButtonStackView)
    return view
  }()
  lazy var toolbarCloseButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
    let image = UIImage(systemName: "xmark", withConfiguration: config)
    button.setImage(image, for: .normal)
    button.tintColor = .white
    button.contentMode = .scaleAspectFill
    return button
  }()
  lazy var toolbarGiftButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
    let image = UIImage(systemName: "gift.circle", withConfiguration: config)
    button.setImage(image, for: .normal)
    return button
  }()
  lazy var toolbarPayButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
    let image = UIImage(systemName: "qrcode", withConfiguration: config)
    button.setImage(image, for: .normal)
    return button
  }()
  lazy var toolbarSettingButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
    let image = UIImage(systemName: "gearshape.circle", withConfiguration: config)
    button.setImage(image, for: .normal)
    return button
  }()
  lazy var toolbarButtonStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [toolbarGiftButton, toolbarPayButton, toolbarSettingButton])
    stack.axis = .horizontal
    stack.spacing = 15
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.tintColor = .white
    return stack
  }()
  
  // 하단 푸터 뷰
  lazy var footerView: UIView = {
    let view = UIView()
    view.addSubview(footerButtonStackView)
    view.addSubview(divider)
    return view
  }()
  // 하단 푸터 구분선 뷰
  lazy var divider: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
    return view
  }()
  // 하단 푸터 버튼 스택뷰
  lazy var footerButtonStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [chatMeButton, setProfileButton, kakaostoryButton])
    stack.axis = .horizontal
    stack.spacing = 15
    stack.alignment = .fill
    stack.distribution = .fillEqually
    return stack
  }()
  lazy var chatMeButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "나와의 채팅"
    configuration.titleAlignment = .center
    configuration.image = UIImage(systemName: "bubble.left.fill")
    configuration.imagePlacement = .top
    configuration.imagePadding = 8
    configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
    configuration.baseBackgroundColor = .clear
    configuration.baseForegroundColor = .white
    configuration.buttonSize = .small
    let button = UIButton(configuration: configuration)
    return button
  }()
  lazy var setProfileButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "프로필 편집"
    configuration.titleAlignment = .center
    configuration.imagePlacement = .top
    configuration.baseBackgroundColor = .clear
    configuration.baseForegroundColor = .white
    configuration.imagePadding = 8
    configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
    configuration.image = UIImage(systemName: "person.crop.circle.fill")
    configuration.buttonSize = .small
    let button = UIButton(configuration: configuration)
    return button
  }()
  lazy var kakaostoryButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "카카오스토리"
    configuration.titleAlignment = .center
    configuration.imagePlacement = .top
    configuration.baseBackgroundColor = .clear
    configuration.baseForegroundColor = .white
    configuration.imagePadding = 8
    configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
    configuration.image = UIImage(systemName: "paperplane.fill")
    configuration.buttonSize = .small
    let button = UIButton(configuration: configuration)
    return button
  }()
  
  // 프로필 뷰
  lazy var profileView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.addSubview(profileImage)
    view.addSubview(profileLabel)
    view.clipsToBounds = true
    return view
  }()
  lazy var profileImage: UIImageView = {
    let view = UIImageView()
    let image = UIImage(named: "무민")
    view.image = image
    view.contentMode = .scaleAspectFill
    view.layer.cornerRadius = 60
    view.clipsToBounds = true
    return view
  }()
  lazy var profileLabel: UILabel = {
    let label = UILabel()
    label.text = "무미니"
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
    
  func configureUI() {
    setSuperLayoutVew()
    setupToolbar()
    setupFooter()
    setupProfileView()
    setupProfileLabel()
  }
  
  func setSuperLayoutVew() {
    [backgroundImageView, toolbarView, footerView, profileView].forEach { view.addSubview($0) }
    
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
    
    toolbarView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.horizontalEdges.equalTo(view)
      make.height.equalTo(60)
    }
    
    footerView.snp.makeConstraints { make in
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.horizontalEdges.equalTo(view)
      make.height.equalTo(120)
    }
    
    profileView.snp.makeConstraints { make in
      make.bottom.equalTo(footerView.snp.top).offset(-30)
      make.centerX.equalTo(view)
      make.width.equalTo(120)
    }
  }
  
  func setupToolbar() {
    toolbarCloseButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(5)
      make.top.equalToSuperview()
      make.bottom.equalToSuperview()
      make.width.equalTo(toolbarView.snp.height)
    }
    
    toolbarButtonStackView.snp.makeConstraints { make in
      make.trailing.equalToSuperview().offset(-20)
      make.top.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
  
  func setupFooter() {
    footerButtonStackView.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    divider.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.horizontalEdges.equalToSuperview()
      make.height.equalTo(1)
    }
  }
  
  func setupProfileView() {
    profileImage.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.horizontalEdges.equalToSuperview()
      make.height.equalTo(120)
    }
  }
  
  func setupProfileLabel() {
    profileLabel.snp.makeConstraints { make in
      make.top.equalTo(profileImage.snp.bottom).offset(10)
      make.bottom.equalToSuperview()
      make.horizontalEdges.equalToSuperview()
    }
  }
  
}
