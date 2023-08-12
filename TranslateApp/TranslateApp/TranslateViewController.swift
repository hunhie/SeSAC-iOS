//
//  TranslateViewController.swift
//  TranslateApp
//
//  Created by walkerhilla on 2023/08/10.
//

import UIKit

enum LanguageTranslationMode {
  case detect
  case select(LanguageCode)
  
  func asString() -> String {
    switch self {
    case .detect:
      return "언어 감지"
    case .select(let value):
      return value.languageString()
    }
  }
  
  func asLanguageCode() -> LanguageCode? {
    switch self {
    case .detect:
      return nil
    case .select(let value):
      return value
    }
  }
}

final class TranslateViewController: UIViewController, LanguageDelegate {
  
  //MARK: - Interface Builder Property
  @IBOutlet weak var translateView: UIView!
  @IBOutlet weak var originView: UIView!
  @IBOutlet weak var originLanguageLabel: UILabel!
  @IBOutlet weak var originTextView: UITextView!
  @IBOutlet weak var translatedView: UIView!
  @IBOutlet weak var translatedLanguageLabel: UILabel!
  @IBOutlet weak var translatedTextView: UITextView!
  
  //MARK: - Programmatically View Property
  lazy var languageSettingView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var translateFromButton: UIButton = {
    let button = UIButton()
    button.tag = 0
    button.layer.cornerRadius = 8
    button.clipsToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.gray.cgColor
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15)
    button.addTarget(self, action: #selector(selectLanguage(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var translateToButton: UIButton = {
    let button = UIButton()
    button.tag = 1
    button.layer.cornerRadius = 8
    button.clipsToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.gray.cgColor
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15)
    button.addTarget(self, action: #selector(selectLanguage(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var translateFromToIamgeView: UIImageView = {
    let image = UIImage(systemName: "arrow.left.arrow.right")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.tintColor = .black
    return imageView
  }()
  
  let papagoAPIManager = PapagotAPIManager()
  
  var translateFrom: LanguageTranslationMode = .detect
  var translateTo: LanguageCode = .en
  
  let originTextViewPlaceHolder = "Enter Text"
  
  //MARK: - View Controller Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  /// UI 설정
  ///
  /// ViewController 내 존재하는 모든 UI 설정 메소드를 호출합니다.
  func configureUI() {
    setupLanguageSettingView()
    setupOriginView()
    setupTranslatedView()
    setupTranslateTo(translateTo: translateTo)
    setupTranslateFrom(translateFrom: translateFrom)
  }
  
  /// 원본 언어 뷰
  func setupOriginView() {
    originTextView.delegate = self
    originTextView.text = originTextViewPlaceHolder
    originTextView.font = .systemFont(ofSize: 30)
  }
  
  /// 목적 언어 뷰
  func setupTranslatedView() {
    translatedTextView.isEditable = false
    translatedTextView.font = .systemFont(ofSize: 17)
    translatedLanguageLabel.textColor = .blue
    translatedTextView.textColor = .blue
  }
  
  /// 언어 설정 뷰
  func setupLanguageSettingView() {
    languageSettingView.addSubview(translateFromButton)
    languageSettingView.addSubview(translateToButton)
    languageSettingView.addSubview(translateFromToIamgeView)
    view.addSubview(languageSettingView)
    
    translatedView.isHidden = true
    
    NSLayoutConstraint.activate([
      languageSettingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      languageSettingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      languageSettingView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
      languageSettingView.heightAnchor.constraint(equalToConstant: 50),
      
      translateFromButton.leadingAnchor.constraint(equalTo: languageSettingView.leadingAnchor, constant: 20),
      translateFromButton.topAnchor.constraint(equalTo: languageSettingView.topAnchor, constant: 5),
      translateFromButton.bottomAnchor.constraint(equalTo: languageSettingView.bottomAnchor, constant: 5),
      translateFromButton.widthAnchor.constraint(equalTo: languageSettingView.widthAnchor, multiplier: 0.33),
      
      translateToButton.trailingAnchor.constraint(equalTo: languageSettingView.trailingAnchor, constant: -20),
      translateToButton.topAnchor.constraint(equalTo: languageSettingView.topAnchor, constant: 5),
      translateToButton.bottomAnchor.constraint(equalTo: languageSettingView.bottomAnchor, constant: 5),
      translateToButton.widthAnchor.constraint(equalTo: languageSettingView.widthAnchor, multiplier: 0.33),
      
      translateFromToIamgeView.centerXAnchor.constraint(equalTo: languageSettingView.centerXAnchor),
      translateFromToIamgeView.centerYAnchor.constraint(equalTo: languageSettingView.centerYAnchor),
    ])
    
  }
  
  /// 원본 언어, 목적 언어 설정 메소드
  func setupTranslateTo(translateTo: LanguageCode) {
    self.translateToButton.setTitle(translateTo.languageString(), for: .normal)
    self.translatedLanguageLabel.text = translateTo.languageString()
  }
  
  func setupTranslateFrom(translateFrom: LanguageTranslationMode) {
    switch translateFrom {
    case .detect:
      let detect = "언어 감지"
      self.translateFromButton.setTitle(detect, for: .normal)
      self.originLanguageLabel.text = detect
    case .select(let code):
      self.translateFromButton.setTitle(code.languageString(), for: .normal)
      self.originLanguageLabel.text = code.languageString()

    }
  }
  
  func translateText(translateFrom: LanguageCode, target: LanguageCode) {
    papagoAPIManager.translateLanguage(source: translateFrom, target: translateTo, text: originTextView.text) { result in
      self.translatedTextView.text = result
    }
  }
  
  @objc func selectLanguage(_ sender: UIButton) {
    let vc = storyboard?.instantiateViewController(withIdentifier: LanguageSelectViewController.identifier) as! LanguageSelectViewController
    vc.delegate = self
    vc.translateFrom = translateFrom
    vc.isTranslateFrom = sender.tag == 0 ? true : false
    
    present(vc, animated: true)
  }
  
  @IBAction func tapGesture(_ sender: Any) {
    view.endEditing(true)
  }
}

/// TextView Deleagte 확장 구현
extension TranslateViewController: UITextViewDelegate {
  
  /// 언어 감지
  ///
  /// PapagoAPIManager를 통해 매개변수로 전달 받은 텍스트의 언어를 감지하여 UI를 업데이트합니다.
  ///
  /// **Parameters**
  /// - text: String?, 감지할 문자열
  func detectText(_ text: String?) {
    guard let text,
          text.count > 0 else {
      self.setupTranslateFrom(translateFrom: LanguageTranslationMode.detect)
      self.translateFrom = .detect
      return
    }
    papagoAPIManager.detectLanguage(text: text) { result in
      guard let result else { return }
      
      self.setupTranslateFrom(translateFrom: LanguageTranslationMode.select(result))
      self.translateFrom = .select(result)
    }
  }
  
  /// TextView에 변경사항이 발생했을 때 실행되는 메소드
  func textViewDidChange(_ textView: UITextView) {
    switch translateFrom {
    case .detect:
      self.detectText(textView.text)
    case .select:
      break
    }
  }
  
  /// TextView에 입력이 시작될 때 실행되는 메소드
  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
    self.translatedView.isHidden = true
    textView.text = nil

    self.originTextView.font = .systemFont(ofSize: 17)
    return true
  }
  
  /// TextView의 입력이 종료되었을 때 실행되는 메소드
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text != originTextViewPlaceHolder && textView.text.count == 0 {
      self.detectText(textView.text)
      textView.font = .systemFont(ofSize: 30)
      textView.text = originTextViewPlaceHolder
    } else {
      self.translatedView.isHidden = false
      
      guard let translateFrom = translateFrom.asLanguageCode() else { return }
      
      if translateFrom != translateTo {
        translateText(translateFrom: translateFrom, target: translateTo)
      } else {
        self.translatedTextView.text = textView.text
      }
    }
  }
  
  /// TextView에 새로운 텍스트가 입력될 때마다 실행되는 메소드
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
      view.endEditing(true)
    }
    return true
  }
}
