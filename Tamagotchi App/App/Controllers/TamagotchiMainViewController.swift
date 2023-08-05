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
    
    if let savedData = UserDefaults.standard.object(forKey: StringConstant.selectedTamagotchi) as? Data {
        let decoder = JSONDecoder()
        if let savedObject = try? decoder.decode(Tamagotchi.self, from: savedData) {
          self.tamagotchi = savedObject
        }
    }
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  // MARK: - UI Setup
  
  func configureUI() {
    
    view.backgroundColor = ColorConstant.backgroundColor
    
    setupNavigationBar()
    setupDivider()
    setupMessageView()
    setupTamagotchiImageView()
    setupTamagotchiNameView()
    setupTamagotchiStatusLabel()
    setupRiceGrainRowView()
    setupWaterDropletsRowView()
  }
  
  func setupNavigationBar() {
    
    let titleLabel = UILabel()
    titleLabel.text = User.shared.name+StringConstant.yourTamagotchi
    titleLabel.textColor = ColorConstant.textColor
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
    navigationItem.titleView = titleLabel

    let settingBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(settingBarButtonTapped))
    settingBarButtonItem.tintColor = ColorConstant.textColor
    navigationItem.rightBarButtonItem = settingBarButtonItem
  }
  
  func setupDivider() {
    
    divider.backgroundColor = ColorConstant.dividerColor
  }
  
  func setupMessageView() {
    
    messageBubbleView.image = UIImage(named: StringConstant.bubble)
    messageLabel.text = Tamagotchi.statusMessage[.common]?.randomElement()
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
    
  }
  
  @IBAction func waterDropletsButtonTapped(_ sender: UIButton) {
    
  }
}

