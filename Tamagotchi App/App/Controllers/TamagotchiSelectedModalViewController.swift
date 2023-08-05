//
//  TamagotchiSelectedModalViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import UIKit

final class TamagotchiSelectedModalViewController: UIViewController {
  
  // MARK: - Properties
  
  static let identifier = "TamagotchiSelectedModalViewController"
  
  @IBOutlet weak var modalBackView: UIView!
  @IBOutlet weak var modalInnerView: UIView!
  @IBOutlet weak var tamagotchiImageView: UIImageView!
  @IBOutlet weak var tamagotchiNameView: UIView!
  @IBOutlet weak var tamagotchiNameLabel: UILabel!
  @IBOutlet weak var tamagotchiMessageLabel: UILabel!
  @IBOutlet var dividers: [UIView]!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var startButton: UIButton!
  
  var tamagotchi: Tamagotchi?
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    
    setupDivider()
    setupModalBackView()
    setupTamagotchiImageView()
    setupTamagotchiNameView()
    setupTamagotchiNameLabel()
    setupTamagotchiMessageLabel()
    setupButttons()
  }
  
  func setupModalBackView() {
    
    modalInnerView.backgroundColor = .clear
    modalBackView.backgroundColor = ColorConstant.backgroundColor
    modalBackView.layer.cornerRadius = 8
    modalBackView.clipsToBounds = true
  }
  
  func setupDivider() {
    
    dividers.forEach{ divider in
      divider.backgroundColor = ColorConstant.dividerColor
    }
  }
  
  func setupTamagotchiImageView() {
    
    guard let tamagotchi else { return }
    tamagotchiImageView.image = UIImage(named: tamagotchi.defaultImagePathToString)
  }
  
  func setupTamagotchiNameView() {
    
    tamagotchiNameView.backgroundColor = ColorConstant.labelBackgroundColor
    tamagotchiNameView.layer.borderColor = ColorConstant.textColor.cgColor
    tamagotchiNameView.layer.borderWidth = 0.7
    tamagotchiNameView.layer.cornerRadius = 5
    tamagotchiNameView.clipsToBounds = true
  }
  
  func setupTamagotchiNameLabel() {
    
    guard let tamagotchi else { return }
    tamagotchiNameLabel.text = tamagotchi.name
    tamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
    tamagotchiNameLabel.textColor = ColorConstant.textColor
  }
  
  func setupTamagotchiMessageLabel() {
    
    guard let tamagotchi else { return }
    tamagotchiMessageLabel.text = tamagotchi.profileMessage
    tamagotchiMessageLabel.font = .systemFont(ofSize: 13)
    tamagotchiMessageLabel.textColor = ColorConstant.textColor
    tamagotchiMessageLabel.textAlignment = .center
    tamagotchiMessageLabel.numberOfLines = 0
  }
  
  func setupButttons() {
    
    startButton.setTitle("시작하기", for: .normal)
    startButton.setTitleColor(ColorConstant.textColor, for: .normal)
    startButton.titleLabel?.font = .systemFont(ofSize: 14)
    startButton.setBackgroundColor(ColorConstant.buttonSelectedColor, for: .highlighted)
    
    cancelButton.setTitle("취소", for: .normal)
    cancelButton.setTitleColor(ColorConstant.textColor, for: .normal)
    cancelButton.titleLabel?.font = .systemFont(ofSize: 14)
    cancelButton.setBackgroundColor(ColorConstant.buttonSelectedColor, for: .highlighted)
  }
  
  
  // MARK: - IBActions

  
  @IBAction func cancelButtonTapped(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
  @IBAction func startButtonTapped(_ sender: UIButton) {
    UserDefaults.standard.setValue(true, forKey: "isLaunched")

    if let encoded = try? JSONEncoder().encode(tamagotchi) {
        UserDefaults.standard.setValue(encoded, forKey: "selectedTamagotchi")
    }
    
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate
    
    let vc = storyboard?.instantiateViewController(identifier: TamagotchiMainViewController.identifier) as! TamagotchiMainViewController
    vc.tamagotchi = self.tamagotchi
    
    sceneDelegate?.window?.rootViewController = vc
    sceneDelegate?.window?.makeKeyAndVisible()
  }
}
