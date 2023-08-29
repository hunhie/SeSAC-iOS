//
//  UIViewController+Extension.swift
//  SeSAC3Framework
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit

extension UIViewController {
  public func sesacShowAlert(title: String, message: String, buttonTitle: String, buttonAction: @escaping (UIAlertAction) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    let ok = UIAlertAction(title: buttonTitle, style: .default, handler: buttonAction)
    alert.addAction(cancel)
    alert.addAction(ok)
    present(alert, animated: true)
  }
  
  public func sesacShowActivityViewCOntroller(image: UIImage, url: String, text: String) {
    let vc = UIActivityViewController(activityItems: [image, url, text], applicationActivities: nil)
    vc.excludedActivityTypes = .none
    present(vc, animated: true)
  }
}

