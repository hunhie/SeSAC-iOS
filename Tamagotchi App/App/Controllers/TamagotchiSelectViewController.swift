//
//  TamagotchiSelectViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/04.
//

import UIKit

/// 다마고치 선택하기 화면 뷰 컨트롤러
final class TamagotchiSelectViewController: UIViewController {
  
  //MARK: - View Property
  
  @IBOutlet weak var tamagotchiSelectCollectionView: UICollectionView!
  
  //MARK: - View Controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    registerTamagotchiSelectCell()
  }
  
  //MARK: - setup UI
  
  /// Cell Register Method
  private func registerTamagotchiSelectCell() {
    let nib = UINib(nibName: TamagotchiSelectCollectionViewCell.identifier, bundle: nil)
    tamagotchiSelectCollectionView.register(nib, forCellWithReuseIdentifier: TamagotchiSelectCollectionViewCell.identifier)
  }
  
  //MARK: - Actions
}


// extension for CollectionView Delegate, Datasource
extension TamagotchiSelectViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  // section count
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  // configure Cell
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiSelectCollectionViewCell.identifier, for: indexPath) as? TamagotchiSelectCollectionViewCell else { return UICollectionViewCell() }
    
    
    return cell
  }
  
  
}
