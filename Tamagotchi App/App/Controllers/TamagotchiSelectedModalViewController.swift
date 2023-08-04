//
//  TamagotchiSelectedModalViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import UIKit

final class TamagotchiSelectedModalViewController: UIViewController {
  
  static let identifier = "TamagotchiSelectedModalViewController"
  
  @IBOutlet weak var modalBackView: UIView!
  
  var tamagotchi: Tamagotchi?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
