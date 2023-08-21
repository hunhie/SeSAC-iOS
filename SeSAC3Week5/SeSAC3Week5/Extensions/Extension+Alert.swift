//
//  Extension+Alert.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import UIKit

extension UIViewController {
  func showAlert(title: String, message: String, button: String, completion: @escaping () -> Void) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let button = UIAlertAction(title: button, style: .default) { action in
      completion()
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    
    alertController.addAction(button)
    alertController.addAction(cancel)
    
    self.present(alertController, animated: true)
    
  }
}
