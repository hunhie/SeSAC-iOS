//
//  TamagotchiSelectCollectionViewCell.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import UIKit

/// Tamagotchi Select View Controller > tamagotchiSelectCollectionView 에서 사용되는 collectionView Cell 입니다.
///
/// identifier = "TamagotchiSelectCollectionViewCell"
///
/// 다마고치 캐릭터 이미지 뷰와 다마고치 이름 레이블을 포함하고 있습니다.
final class TamagotchiSelectCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "TamagotchiSelectCollectionViewCell"
  
  @IBOutlet weak var tamagotchiBackView: UIView!
  @IBOutlet weak var tamagotchiImageView: UIImageView!
  @IBOutlet weak var tamagotchiNameView: UIView!
  @IBOutlet weak var tamagotchiNameLabel: UILabel!
  
  
  var tamagotchi: Tamagotchi?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    tamagotchiBackView.backgroundColor = ColorConstant.backgroundColor
    
    tamagotchiNameView.backgroundColor = ColorConstant.labelBackgroundColor
    tamagotchiNameView.layer.cornerRadius = 3
    tamagotchiNameView.layer.borderWidth = 1
    tamagotchiNameView.layer.borderColor = ColorConstant.textColor.cgColor
    tamagotchiNameView.clipsToBounds = true
    
    tamagotchiNameLabel.textAlignment = .center
    tamagotchiNameLabel.font = .boldSystemFont(ofSize: 11)
    tamagotchiNameLabel.textColor = ColorConstant.textColor
    
  }
  
  func configureCell() {
    
    if let tamagotchi {
      tamagotchiNameLabel.text = tamagotchi.name
      tamagotchiImageView.image = UIImage(named: tamagotchi.imagePathToString)
    } else {
      tamagotchiNameLabel.text = StringConstant.tamagotchiPreparing
      tamagotchiImageView.image = UIImage(named: "noImage")
    }
  }
}
