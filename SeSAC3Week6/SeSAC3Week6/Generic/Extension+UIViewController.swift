//
//  Extension+UIViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit

extension UIViewController {
  
  enum TransitionStyle {
    enum presentStyle {
      case normal
      case withNavigation
      case FullNavigation
    }
    
    case present(presentStyle)
    case push
  }
  
  func transition<T: UIViewController>(viewController: T, style: TransitionStyle) {
    switch style {
    case .present(.normal):
      present(viewController, animated: true)
    case .present(.withNavigation):
      let nav = UINavigationController(rootViewController: viewController)
      present(nav, animated: true)
    case .present(.FullNavigation):
      let nav = UINavigationController(rootViewController: viewController)
      nav.modalPresentationStyle = .fullScreen
      present(nav, animated: true)
    case .push:
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
  func configureBorder<T: UIView>(view: T) {
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 0.5
  }
  
  func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
    return a + b
  }
}
