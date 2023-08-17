//
//  TranslationViewController.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/07.
//

import UIKit
import Alamofire
import SwiftyJSON

class TranslationViewController: UIViewController {
  
  @IBOutlet weak var requestButton: UIButton!
  @IBOutlet weak var originTextView: UITextView!
  @IBOutlet weak var translateTextView: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    requestButton.setTitle("번역", for: .normal)
  }
  
  @IBAction func requestButtonTapped(_ sender: UIButton) {
    guard let text = originTextView.text else { return }
    TranslateAPIManager.shared.callRequest(text: text) { result in
      self.translateTextView.text = result
    }
  }
}
