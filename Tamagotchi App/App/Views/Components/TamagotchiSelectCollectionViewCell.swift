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
  
  @IBOutlet weak var tamagotchiImageView: UIImageView!
  @IBOutlet weak var tamagotchiNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
}
