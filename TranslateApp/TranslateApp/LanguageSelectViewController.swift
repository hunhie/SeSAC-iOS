//
//  LanguageSelectViewController.swift
//  TranslateApp
//
//  Created by walkerhilla on 2023/08/11.
//

import UIKit

final class LanguageSelectViewController: UIViewController {
  
  static let identifier = "LanguageSelectViewController"
  
  @IBOutlet weak var backButton: UIBarButtonItem!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var navigationBar: UINavigationItem!
  
  var isTranslateFrom: Bool?
  var translateFrom: LanguageTranslationMode = .detect
  let languages = LanguageCode.allCases.map{ LanguageTranslationMode.select($0) }
  var languageList: [[LanguageTranslationMode]] {
    [[.detect], languages]
  }
  
  var delegate: LanguageDelegate?

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    setupTitle()
    setupBackButton()
  }
  
  func setupTitle() {
    guard let isTranslateFrom else { return }
    self.navigationBar.title = isTranslateFrom ? "Translate from" : "Translate To"
  }
  
  func setupBackButton() {
    self.backButton.tintColor = .lightGray
  }
  
  @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true)
  }
}

extension LanguageSelectViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? nil : "ALL LANGUAGES"
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    isTranslateFrom! ? 2 : 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    isTranslateFrom! ? languageList[section].count : languageList[1].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let language = isTranslateFrom! ? languageList[indexPath.section][indexPath.row] : languageList[1][indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "languageSelectTableViewCell") else { return UITableViewCell() }
    
    cell.textLabel?.text = language.asString()

    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectLanguage = isTranslateFrom! ? languageList[indexPath.section][indexPath.row] : languageList[1][indexPath.row]

    if let isTranslateFrom,
       isTranslateFrom {
      switch selectLanguage {
      case .detect:
        delegate?.translateFrom = .detect
        delegate?.setupTranslateFrom(translateFrom: LanguageTranslationMode.detect)
      case .select(let code):
        delegate?.translateFrom = .select(code)
        delegate?.setupTranslateFrom(translateFrom: LanguageTranslationMode.select(code))
      }
    } else {
      guard let translateFromCode = translateFrom.asLanguageCode(),
            let selectLanguageCode = selectLanguage.asLanguageCode() else { return }
      delegate?.translateTo = selectLanguageCode
      delegate?.setupTranslateTo(translateTo: selectLanguageCode)
      delegate?.translateText(translateFrom: translateFromCode, target: selectLanguageCode)
    }
    
    dismiss(animated: true)
  }
}
