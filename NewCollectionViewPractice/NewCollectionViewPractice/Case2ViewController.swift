//
//  Case2ViewController.swift
//  NewCollectionViewPractice
//
//  Created by walkerhilla on 2023/09/16.
//

import UIKit
import SnapKit

final class Case2ViewController: UIViewController {
  
  lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    return view
  }()
  
  let list = [
    [
      Case2Item(title: "공지사항"),
      Case2Item(title: "실험실"),
      Case2Item(title: "버전 정보")
    ],
    [
      Case2Item(title: "개인/보안"),
      Case2Item(title: "알림"),
      Case2Item(title: "채팅"),
      Case2Item(title: "멀티프로필")
    ],
    [
      Case2Item(title: "고객센터/도움말")
    ]
  ]
  
  var dataSource: UICollectionViewDiffableDataSource<Int, Case2Item>?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "설정"
    
    configureView()
    setConstraints()
  }
  
  func configureView() {
    setCollectionView()
  }
  
  func setConstraints() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setCollectionView() {
    view.addSubview(collectionView)
    
    let cellRegistraion = UICollectionView.CellRegistration<UICollectionViewListCell, Case2Item> { cell, indexPath, itemIdentifier in
      var content = UIListContentConfiguration.valueCell()
      content.text = itemIdentifier.title
      cell.contentConfiguration = content
    }
    
    dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
      let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistraion, for: indexPath, item: itemIdentifier)
      return cell
    })
    
    var snapshot = NSDiffableDataSourceSnapshot<Int, Case2Item>()
    snapshot.appendSections([0, 1, 2])
    for i in 0...2 {
      snapshot.appendItems(list[i], toSection: i)
    }
    
    dataSource?.apply(snapshot)
  }
  
  private func createLayout() -> UICollectionViewLayout {
    let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
    let layout = UICollectionViewCompositionalLayout.list(using: configuration)
    return layout
  }
}
