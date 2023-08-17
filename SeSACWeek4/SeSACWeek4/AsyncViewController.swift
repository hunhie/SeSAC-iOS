//
//  AsyncViewController.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/11.
//

import UIKit

class AsyncViewController: UIViewController {
  
  @IBOutlet weak var firstImageView: UIImageView!
  @IBOutlet weak var secondImageView: UIImageView!
  @IBOutlet weak var thirdImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    firstImageView.contentMode = .scaleAspectFill
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    self.firstImageView.layer.cornerRadius = self.firstImageView.frame.width/2
    self.firstImageView.clipsToBounds = true
  }
  @IBAction func buttonTapped(_ sender: Any) {
    let url = URL(string: "https://api.nasa.gov/assets/img/general/apod.jpg")!
    DispatchQueue.global().async {
      let data = try! Data(contentsOf: url)
      DispatchQueue.main.async {
        self.firstImageView.image = UIImage(data: data)
      }
    }
    print("asdasd")
  }
  
  @IBAction func switchToggled(_ sender: UISwitch) {
  }
}
