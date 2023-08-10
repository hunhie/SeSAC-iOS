//
//  LanguageDelegate.swift
//  TranslateApp
//
//  Created by walkerhilla on 2023/08/11.
//

import Foundation

protocol LanguageDelegate {
  func setupTranslateFrom(translateFrom: LanguageTranslationMode) -> Void
  func setupTranslateTo(translateTo: LanguageCode) -> Void
}
