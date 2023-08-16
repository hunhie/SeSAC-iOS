//
//  TamagotchiMainViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import UIKit

final class TamagotchiMainViewController: UIViewController {
  
  // MARK: - Properties
  
  static let identifier = "TamagotchiMainViewController"
  var tamagotchi: Tamagotchi?
  
  @IBOutlet weak var divider: UIView!
  
  @IBOutlet weak var messageBubbleView: UIImageView!
  @IBOutlet weak var messageLabel: UILabel!
  
  @IBOutlet weak var tamagotchiImageView: UIImageView!
  @IBOutlet weak var tamagotchiNameView: UIView!
  @IBOutlet weak var tamagotchiNameLabel: UILabel!
  @IBOutlet weak var tamagotchiStatusLabel: UILabel!
  
  @IBOutlet weak var riceGrainRowView: UIView!
  @IBOutlet weak var riceGrainTextField: UITextField!
  @IBOutlet weak var riceGrainDividerView: UIView!
  @IBOutlet weak var riceGrainButtonView: UIView!
  @IBOutlet weak var riceGrainButton: UIButton!
  
  @IBOutlet weak var waterDropletsRowView: UIView!
  @IBOutlet weak var waterDropletsTextField: UITextField!
  @IBOutlet weak var waterDropletsDividerView: UIView!
  @IBOutlet weak var waterDropletsButtonView: UIView!
  @IBOutlet weak var waterDropletsButton: UIButton!
  
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let tamagotchi = TamagotchiManager.shared.loadData() else { return }
    self.tamagotchi = tamagotchi
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setupMessageView(type: .common)
    setupNavigationTitleView()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    guard let tamagotchi else { return }
    TamagotchiManager.shared.saveData(tamagotchi: tamagotchi)
  }
  
  // MARK: - UI Setup
  
  func configureUI() {
    
    view.backgroundColor = ColorConstant.backgroundColor
    
    setupNavigationBar()
    setupDivider()
    setupMessageView(type: Tamagotchi.tamagotchiAction(riceGrain: nil, waterDroplets: nil))
    setupTamagotchiImageView()
    setupTamagotchiNameView()
    setupTamagotchiStatusLabel()
    setupRiceGrainRowView()
    setupWaterDropletsRowView()
  }
  
  func setupNavigationBar() {
    
    setupNavigationTitleView()
    
    let settingBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(settingBarButtonTapped))
    settingBarButtonItem.tintColor = ColorConstant.textColor
    navigationItem.rightBarButtonItem = settingBarButtonItem
  }
  
  func setupNavigationTitleView() {
    let titleLabel = UILabel()
    titleLabel.text = User.shared.name+StringConstant.yourTamagotchi
    titleLabel.textColor = ColorConstant.textColor
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
    navigationItem.titleView = titleLabel
  }
  
  func setupDivider() {
    
    divider.backgroundColor = ColorConstant.dividerColor
  }
  
  func setupMessageView(type: MessageType) {
    
    messageBubbleView.image = UIImage(named: StringConstant.bubble)
    messageLabel.text = Tamagotchi.statusMessage(type: type)
    messageLabel.font = .monospacedDigitSystemFont(ofSize: 13, weight: .bold)
    messageLabel.textAlignment = .center
    messageLabel.textColor = ColorConstant.textColor
  }
  
  func setupTamagotchiImageView() {
    
    guard let tamagotchi else { return }
    tamagotchiImageView.image = UIImage(named: tamagotchi.imagePathToString)
  }
  
  func setupTamagotchiNameView() {
    
    tamagotchiNameView.backgroundColor = ColorConstant.labelBackgroundColor
    tamagotchiNameView.layer.cornerRadius = 5
    tamagotchiNameView.layer.borderWidth = 1
    tamagotchiNameView.layer.borderColor = ColorConstant.textColor.cgColor
    tamagotchiNameView.clipsToBounds = true
    
    guard let tamagotchi else { return }
    
    tamagotchiNameLabel.text = tamagotchi.name
    tamagotchiNameLabel.textAlignment = .center
    tamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
    tamagotchiNameLabel.textColor = ColorConstant.textColor
  }
  
  func setupTamagotchiStatusLabel() {
    
    let statusText = "LV\(Tamagotchi.level) · 밥알 \(Tamagotchi.riceGrain)개 · 물방울 \(Tamagotchi.waterDroplets)개"
    tamagotchiStatusLabel.text = statusText
    tamagotchiStatusLabel.textColor = ColorConstant.textColor
    tamagotchiStatusLabel.font = .boldSystemFont(ofSize: 12)
  }
  
  func setupRiceGrainRowView() {
    
    riceGrainRowView.backgroundColor = .clear
    
    riceGrainTextField.delegate = self
    riceGrainTextField.attributedPlaceholder = NSAttributedString(string: "밥주세용", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    riceGrainTextField.textAlignment = .center
    riceGrainTextField.keyboardType = .numberPad
    
    riceGrainDividerView.backgroundColor = ColorConstant.textColor
    
    riceGrainButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
    riceGrainButton.tintColor = ColorConstant.textColor
    riceGrainButton.setTitleColor(ColorConstant.textColor, for: .normal)
    riceGrainButton.setAttributedTitle(NSAttributedString(string: " 밥먹기", attributes: [.font: UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .heavy)]) , for: .normal)
    
    riceGrainButtonView.layer.cornerRadius = 8
    riceGrainButtonView.layer.borderColor = ColorConstant.textColor.cgColor
    riceGrainButtonView.layer.borderWidth = 1
    riceGrainButtonView.backgroundColor = .clear
  }
  
  func setupWaterDropletsRowView() {
    
    waterDropletsRowView.backgroundColor = .clear
    
    waterDropletsTextField.delegate = self
    waterDropletsTextField.attributedPlaceholder = NSAttributedString(string: "물주세용", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    waterDropletsTextField.textAlignment = .center
    waterDropletsTextField.keyboardType = .numberPad
    
    waterDropletsDividerView.backgroundColor = ColorConstant.textColor
    
    waterDropletsButtonView.layer.cornerRadius = 8
    waterDropletsButtonView.layer.borderColor = ColorConstant.textColor.cgColor
    waterDropletsButtonView.layer.borderWidth = 1
    waterDropletsButtonView.backgroundColor = .clear
    
    waterDropletsButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
    waterDropletsButton.tintColor = ColorConstant.textColor
    waterDropletsButton.setTitleColor(ColorConstant.textColor, for: .normal)
    waterDropletsButton.setAttributedTitle(NSAttributedString(string: " 물먹기", attributes: [.font: UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .heavy)]) , for: .normal)
  }
  
  // MARK: - IBActions
  
  @objc func settingBarButtonTapped() {
    
    let vc = storyboard?.instantiateViewController(identifier: SettingViewController.identifier) as! SettingViewController
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func riceGrainButtonTapped(_ sender: UIButton) {
    guard let text = riceGrainTextField.text else { return }
    do {
      let count = try validateInput(text: text)
      let messageType = Tamagotchi.tamagotchiAction(riceGrain: count, waterDroplets: nil)
      if messageType == .levelUp {
        setupTamagotchiImageView()
      }
      setupMessageView(type: messageType)
      setupTamagotchiStatusLabel()
    } catch {
      switch error {
      case ValidationError.emptyString: print("빈 값")
      case ValidationError.isNotInt: print("숫자 아님")
      case ValidationError.isNotInt: print("범위를 벗어남")
      default: print("Error")
      }
    }
  }
  
  @IBAction func waterDropletsButtonTapped(_ sender: UIButton) {
    guard let text = waterDropletsTextField.text else { return }
    do {
      let count = try validateInput(text: text)
      let messageType = Tamagotchi.tamagotchiAction(riceGrain: nil, waterDroplets: count)
      if messageType == .levelUp {
        setupTamagotchiImageView()
      }
      setupMessageView(type: messageType)
      setupTamagotchiStatusLabel()
    } catch {
      switch error {
      case ValidationError.emptyString: print("빈 값")
      case ValidationError.isNotInt: print("숫자 아님")
      case ValidationError.isNotInt: print("범위를 벗어남")
      default: print("Error")
      }
    }
  }
  
  @IBAction func tapGesture(_ sender: Any) {
    view.endEditing(true)
  }
  
  func validateInput(text: String) throws -> Int {
    guard !text.isEmpty else { throw ValidationError.emptyString }
    
    guard let number = Int(text) else { throw ValidationError.isNotInt }
    
    guard number <= 100 && number > 0 else { throw ValidationError.outOfRange }
    
    return number
  }
}

extension TamagotchiMainViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.becomeFirstResponder()
  }
}

extension TamagotchiMainViewController {
  enum ValidationError: Error {
    case emptyString
    case isNotInt
    case outOfRange
  }
}
