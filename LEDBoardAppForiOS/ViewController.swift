//
//  ViewController.swift
//  LEDBoardAppForiOS
//
//  Created by walkerhilla on 2023/07/25.
//

import UIKit

final class ViewController: UIViewController {
  //MARK: - View Property
  
  @IBOutlet weak var boardLabel: UILabel!
  @IBOutlet weak var boardTextInputView: UIView!
  @IBOutlet weak var boardTextField: UITextField!
  @IBOutlet weak var boardTextFieldReturn: UIButton!
  @IBOutlet weak var boardTextColorChanger: UIButton!
  
  //MARK: - Onother Property
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  //MARK: - UI
  
  /// ViewController의 UI 설정 메소드
  ///
  /// 뷰 컨트롤러 내 모든 뷰에 대한 UI 설정 메소드를 호출합니다.
  private func configureUI() {
    view.backgroundColor = .black
    
    setupBoardTextInputView()
    setupBoardLabel()
  }
  
  /// BoardLabel UI 설정
  private func setupBoardLabel() {
    boardLabel.text = "키워드를 입력하세요."
    boardLabel.textAlignment = .center
    boardLabel.font = .boldSystemFont(ofSize: 60)
    boardLabel.textColor = .red
  }
  
  /// BoardTextInputView UI 설정
  private func setupBoardTextInputView() {
    boardTextInputView.layer.cornerRadius = 8
    boardTextInputView.clipsToBounds = true
    
    setupBoardTextInputViewButtons()
    setupBoardTextField()
  }
  
  /// boradTextField UI 설정
  private func setupBoardTextField() {
    let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
    boardTextField.leftView = paddingView
    boardTextField.leftViewMode = .always
    boardTextField.delegate = self
  }
  
  /// boardTextInputView Buttons UI 설정
  private func setupBoardTextInputViewButtons() {
    boardTextFieldReturn.tintColor = .black
    boardTextColorChanger.tintColor = .red
  }
  
  //MARK: - Private function
  
  private func updateBoardLabelText(_ text: String?) {
    if let text = boardTextField.text,
       text.count > 0 {
      boardLabel.text = text
    }
    
    view.endEditing(true)
  }
  
  private func randomColorPick(_ color: UIColor) -> UIColor {
    let randomColor: [UIColor] = [.blue, .green, .orange, .red, .purple, .white, .magenta]
    guard let random = randomColor.randomElement(),
          random != color else {
      return randomColorPick(color)
    }
    return random
  }
  
  //MARK: - Action
  @IBAction func textFieldReturnButtonTapped(_ sender: UIButton) {
    updateBoardLabelText(boardTextField.text)
  }
  
  @IBAction func boardTextColorChangerTapped(_ sender: UIButton) {
    boardLabel.textColor = randomColorPick(boardLabel.textColor)
  }
  
  @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
    boardTextInputView.isHidden.toggle()
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    updateBoardLabelText(textField.text)
    
    textField.resignFirstResponder()
    return true
  }
}
