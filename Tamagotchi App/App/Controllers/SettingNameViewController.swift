//
//  SettingNameViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/05.
//

import UIKit

final class SettingNameViewController: UIViewController {
  
  static let identifier = "SettingNameViewController"

  // MARK: - Properties
  @IBOutlet weak var navigationBarDivierView: UIView!
  @IBOutlet weak var nameTextFieldView: UIView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameTextFielddividerView: UIView!
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    nameTextField.text = User.shared.name
  }
  
  
  // MARK: - UI Setup

  
  func configureUI() {
    
    view.backgroundColor = ColorConstant.backgroundColor
    
    setupNavigationBar()
    setupNameTextField()
  }
  
  func setupNavigationBar() {
    
    let titleLabel = UILabel()
    titleLabel.text = User.shared.name+StringConstant.setNameTitle
    titleLabel.textColor = ColorConstant.textColor
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
    navigationItem.titleView = titleLabel
    
    let saveBarButtonItem = UIBarButtonItem(title: StringConstant.saveName, style: .plain, target: self, action: #selector(saveBarButtonItemTapped))
    navigationItem.rightBarButtonItem = saveBarButtonItem
    
    navigationBarDivierView.backgroundColor = ColorConstant.dividerColor
    
    checkSaveBarButtonItem()
  }
  
  func setupNameTextField() {
    
    nameTextFieldView.backgroundColor = .clear
    nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
    nameTextFielddividerView.backgroundColor = ColorConstant.textColor
  }
  
  func checkSaveBarButtonItem() {
    guard let text = nameTextField.text,
          text.count > 0 && text != User.shared.name else {
      navigationItem.rightBarButtonItem?.isEnabled = false
      return
    }
    navigationItem.rightBarButtonItem?.isEnabled = true
  }
  
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  @objc func saveBarButtonItemTapped() {
    print(#function)
    guard let text = nameTextField.text else { return }
    User.shared.name = text
    navigationController?.popViewController(animated: true)
  }
  
  @objc func nameTextFieldDidChange(_ sender: UITextField) {
    checkSaveBarButtonItem()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods

}

extension SettingNameViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    
    textField.text = ""
    return true
  }
}
