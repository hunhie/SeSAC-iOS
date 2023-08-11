//
//  LanguageDelegate.swift
//  TranslateApp
//
//  Created by walkerhilla on 2023/08/11.
//

import Foundation

protocol LanguageDelegate {
  var translateFrom: LanguageTranslationMode { get set }
  var translateTo: LanguageCode { get set }
  
  func setupTranslateFrom(translateFrom: LanguageTranslationMode) -> Void
  func setupTranslateTo(translateTo: LanguageCode) -> Void
  func translateText(translateFrom: LanguageCode, target: LanguageCode) -> Void
}
