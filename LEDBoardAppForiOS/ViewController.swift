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
  @IBOutlet weak var boradTextField: UITextField!
  @IBOutlet weak var boardTextFieldReturn: UIButton!
  @IBOutlet weak var boardTextColorChanger: UIButton!
  
  //MARK: - Onother Property
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  //MARK: - Private Function
  
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
    boardLabel.font = .systemFont(ofSize: 50)
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
    boradTextField.leftView = paddingView
    boradTextField.leftViewMode = .always
  }
  
  /// boardTextInputView Buttons UI 설정
  private func setupBoardTextInputViewButtons() {
    boardTextFieldReturn.tintColor = .black
    boardTextColorChanger.tintColor = .red
  }
  
  //MARK: - Action
  
}

