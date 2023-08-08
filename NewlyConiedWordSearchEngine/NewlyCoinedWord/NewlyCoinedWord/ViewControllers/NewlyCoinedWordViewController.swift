//
//  NewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by walkerhilla on 2023/07/21.
//

import UIKit

final class NewlyCoinedWordViewController: UIViewController {
  //MARK: - View Property
  
  /// 검색 버튼
  @IBOutlet weak var searchButton: UIButton!
  
  /// 검색 텍스트 필드
  @IBOutlet weak var searchTextField: UITextField!
  
  /// 키워드 스크롤 뷰
  @IBOutlet weak var recommendKeywordScrollView: UIScrollView!
  
  /// 키워드 설명 레이블
  @IBOutlet weak var keywordDetailLabel: UILabel!
  
  //MARK: - Onother Property
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchTextField.delegate = self
    configureUI()
  }
  
  //MARK: - Private Function
  
  // UI 설정 메소드
  func configureUI() {
    setupSearchTextField()
    setupSearchButton()
    setupRecommendKeyword()
    setupKeywrodDetailLabel()
  }
  
  // TextField UI 설정 메소드
  func setupSearchTextField() {
    searchTextField.layer.cornerRadius = 8
    searchTextField.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMinXMaxYCorner])
    searchTextField.layer.borderWidth = 2
    searchTextField.layer.borderColor = UIColor.black.cgColor
  }
  
  // 검색 버튼 UI 설정 메소드
  func setupSearchButton() {
    searchButton.layer.cornerRadius = 8
    searchButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMaxXMaxYCorner)
  }
  
  // 키워드 스크롤뷰 UI 설정 메소드
  func setupRecommendKeyword() {
    for i in 0..<newlyCoinedKeywords.count {
      let keyword = newlyCoinedKeywords[i]
      let xPos = 80 * i
      let button = UIButton()
      button.layer.cornerRadius = 8
      button.layer.borderColor = UIColor.lightGray.cgColor
      button.layer.borderWidth = 1
      button.setTitle(keyword.name, for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 13)
      button.setTitleColor(UIColor.black, for: .normal)
      button.frame = CGRect(x: xPos, y: 0, width: 70, height: 30)
      button.tag = i
      button.addTarget(self, action: #selector(keywordButtonTapped(_:)), for: .touchUpInside)
      
      recommendKeywordScrollView.addSubview(button)
      recommendKeywordScrollView.contentSize.width = 80 * CGFloat(i + 1)
    }
  }
  
  // 키워드 설명 레이블 UI 설정 메소드
  func setupKeywrodDetailLabel() {
    keywordDetailLabel.numberOfLines = 0
  }
  
  // 키워드 설명 데이터 업데이트 메소드
  func updateKeywordDetail(_ keyword: NewlyCoinedKeyword) {
    keywordDetailLabel.text = keyword.description
  }
  
  // 키워드 검색 메소드
  func searchKeyword() {
    guard let keyword = searchTextField.text,
          keyword.count > 0 else {
      showAlert()
      return
    }
    // 검색한 키워드가 존재하는 경우
    if let keywordResult = searchKeywordQuery(keyword) {
      updateKeywordDetail(keywordResult)
    } else {
      keywordDetailLabel.text = "조회 결과 없음"
    }
  }
  
  // 키워드 검색 쿼리
  func searchKeywordQuery(_ searchStr: String?) -> NewlyCoinedKeyword? {
    guard let searchStr = searchStr else { return nil }
    let index = newlyCoinedKeywords.firstIndex { i in
      i.name == searchStr
    }
    guard let index = index else { return nil }
    return newlyCoinedKeywords[index]
  }
  
  // 알림 표시
  func showAlert() {
    let alert = UIAlertController(title: "알림", message: "검색어를 입력하세요.", preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default)
    alert.addAction(ok)
    present(alert, animated: true)
  }
  
  
  //MARK: - Action
  
  // 화면 빈 영역 탭 메소드
  @IBAction func tagGestureRecognizer(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  // 키워드 탭 메소드
  @objc func keywordButtonTapped(_ sender: UIButton) {
    updateKeywordDetail(newlyCoinedKeywords[sender.tag])
  }
  
  // 검색 버튼 탭 메소드
  @IBAction func searchButtonTapped(_ sender: UIButton) {
    searchKeyword()
    view.endEditing(true)
  }
}

// TextField Delegate 확장 구현
extension NewlyCoinedWordViewController: UITextFieldDelegate {
  // 키보드 Return 클릭 시 실행 메소드
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchKeyword()
    
    // 키보드 내리기
    textField.resignFirstResponder()
    return true
  }
}
