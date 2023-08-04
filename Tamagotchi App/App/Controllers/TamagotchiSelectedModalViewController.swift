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
    modalBackView.backgroundColor = ColorConstant.primaryColor
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
    tamagotchiImageView.image = UIImage(named: tamagotchi.imagePathToString)
  }
  
  func setupTamagotchiNameView() {
    
    tamagotchiNameView.backgroundColor = ColorConstant.secondPrimaryColor
    tamagotchiNameView.layer.borderColor = ColorConstant.thirdPrimaryColor.cgColor
    tamagotchiNameView.layer.borderWidth = 0.7
    tamagotchiNameView.layer.cornerRadius = 5
    tamagotchiNameView.clipsToBounds = true
  }
  
  func setupTamagotchiNameLabel() {
    
    guard let tamagotchi else { return }
    tamagotchiNameLabel.text = tamagotchi.name
    tamagotchiNameLabel.font = .boldSystemFont(ofSize: 13)
    tamagotchiNameLabel.textColor = ColorConstant.thirdPrimaryColor
  }
  
  func setupTamagotchiMessageLabel() {
    
    guard let tamagotchi else { return }
    tamagotchiMessageLabel.text = tamagotchi.profileMessage
    tamagotchiMessageLabel.font = .systemFont(ofSize: 13)
    tamagotchiMessageLabel.textColor = ColorConstant.thirdPrimaryColor
    tamagotchiMessageLabel.textAlignment = .center
    tamagotchiMessageLabel.numberOfLines = 0
  }
  
  func setupButttons() {
    
    startButton.titleLabel?.text = "시작하기"
    cancelButton.titleLabel?.text = "취소"
    cancelButton.titleLabel?.font = .systemFont(ofSize: 14)
    cancelButton.titleLabel?.textColor = ColorConstant.thirdPrimaryColor
    startButton.titleLabel?.font = .systemFont(ofSize: 14)
    startButton.titleLabel?.textColor = ColorConstant.thirdPrimaryColor
    startButton.titleLabel?.text = "시작하기"
  }
  
  
  // MARK: - IBActions
  @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
    dismiss(animated: true)
  }
  
  @IBAction func cancelButtonTapped(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
  @IBAction func startButtonTapped(_ sender: UIButton) {
    let sb = storyboard?.instantiateViewController(identifier: TamagotchiMainViewController.iden)
  }
}
