//
//  ViewController.swift
//  Beer API
//
//  Created by walkerhilla on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var beerImageView: UIImageView!
  @IBOutlet weak var bearNameLabel: UILabel!
  @IBOutlet weak var bearDescLabel: UILabel!
  @IBOutlet weak var randomButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    callRequest()
    setupLabel()
    setupRandomButton()
  }
  
  func setupLabel() {
    label.text = "오늘은 이 맥주를 추천합니다!"
    label.textAlignment = .center
  }
  
  func setupBeerLabel(name: String, desc: String) {
    self.bearNameLabel.text = name
    self.bearDescLabel.text = desc
    self.bearDescLabel.font = .systemFont(ofSize: 12)
    self.bearDescLabel.numberOfLines = 0
  }
  
  func setupBeerImageView(url: String) {
    guard let url = URL(string: url) else {
      let image = UIImage(systemName: "exclamationmark.triangle")
      beerImageView.backgroundColor = .lightGray
      beerImageView.image = image
      beerImageView.tintColor = .yellow
      return
    }
    beerImageView.backgroundColor = .clear
    beerImageView.kf.setImage(with: url)
  }
  
  func setupRandomButton() {
    randomButton.setTitle("다른 맥주 보기", for: .normal)
  }
  
  func callRequest() {
    let url = "https://api.punkapi.com/v2/beers/random"
    AF.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)[0]
        
        let name = json["name"].stringValue
        let desc = json["description"].stringValue
        
        self.setupBeerLabel(name: name, desc: desc)
        
        let url = json["image_url"].stringValue
        self.setupBeerImageView(url: url)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  @IBAction func randomButtonTapped(_ sender: UIButton) {
    callRequest()
  }
}

