//
//  ViewController.swift
//  NewCollectionViewPractice
//
//  Created by walkerhilla on 2023/09/16.
//

import UIKit
import SnapKit

class Case1ViewController: UIViewController {
  
  lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    return view
  }()
  
  let list = [
    [
      Case1Item(title: "방해 금지 모드", subTitle: "켬", imageName: "moon.fill", imageTintColor: .purple, isSideText: true),
      Case1Item(title: "수면", subTitle: nil, imageName: "bed.double.fill", imageTintColor: .orange, isSideText: false),
      Case1Item(title: "업무", subTitle: "09:00 ~ 06:00", imageName: "lanyardcard.fill", imageTintColor: .green, isSideText: false),
      Case1Item(title: "개인 시간", subTitle: "설정", imageName: "person.fill", imageTintColor: .blue, isSideText: true)
    ],
    [
      Case1Item(title: "모든 기기에서 공유", subTitle: nil, imageName: nil, imageTintColor: nil, isSideText: false)
    ]
  ]
  
  var dataSource: UICollectionViewDiffableDataSource<Int, Case1Item>?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "집중 모드"
    
    configureView()
    setConstraints()
  }
  
  private func configureView() {
    setCollectionView()
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setCollectionView() {
    view.addSubview(collectionView)
    
    let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Case1Item> { cell,indexPath,itemIdentifier in
      var content = UIListContentConfiguration.valueCell()
      content.attributedText = NSAttributedString(string: itemIdentifier.title, attributes: [.font: UIFont.systemFont(ofSize: 13)])
      content.secondaryAttributedText =  NSAttributedString(string: itemIdentifier.subTitle ?? "", attributes: [.font: UIFont.systemFont(ofSize: 13)])
      content.image = UIImage(systemName: itemIdentifier.imageName ?? "")
      content.imageProperties.tintColor = itemIdentifier.imageTintColor
      content.prefersSideBySideTextAndSecondaryText = itemIdentifier.isSideText
      cell.contentConfiguration = content
    }
    
    dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
      let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
      cell.accessories = [.disclosureIndicator()]

      return cell
    })
    
    var snapshot = NSDiffableDataSourceSnapshot<Int, Case1Item>()
    snapshot.appendSections([0, 1])
    for i in 0..<list.count {
      snapshot.appendItems(list[i], toSection: i)
    }
    
    dataSource?.apply(snapshot)
  }
  
  
  private func createLayout() -> UICollectionViewLayout {
    let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    let layout = UICollectionViewCompositionalLayout.list(using: configuration)
    return layout
  }
}

