//
//  BaminViewController.swift
//  NewlyCoinedWord
//
//  Created by walkerhilla on 2023/07/23.
//

import UIKit

class BaminViewController: UIViewController {
  //MARK: - View Property
  @IBOutlet weak var headerViewTop: UIView!
  @IBOutlet weak var headerViewMiddle: UIView!
  @IBOutlet weak var headerViewBottom: UIView!
  @IBOutlet weak var searchBar: UIView!
  @IBOutlet weak var searchBarLabel: UILabel!
  @IBOutlet weak var searchBarIcon: UIImageView!
  @IBOutlet var buttonImages: [UIImageView]!
  
  //MARK: - Onother Property
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupHeaderView()
    setupSearchBar()
  }
  
  //MARK: - Private Function
  
  func setupHeaderView() {
    headerViewTop.backgroundColor = UIColor(hexCode: "2AC1BC")
    headerViewBottom.backgroundColor = UIColor(hexCode: "2AC1BC")
    headerViewMiddle.backgroundColor = UIColor(hexCode: "2AC1BC")
    headerViewBottom.layer.cornerRadius = 15
    headerViewBottom.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
  }
  
  func setupSearchBar() {
    searchBar.backgroundColor = .white
    searchBar.layer.cornerRadius = 2
    searchBar.clipsToBounds = true
    searchBar.isUserInteractionEnabled = true
    
    searchBarLabel.textColor = .gray
    searchBarLabel.font = .systemFont(ofSize: 13)
    
    searchBarIcon.tintColor = UIColor(hexCode: "2AC1BC")
    setupGestureRecognizer()
  }
  
  func setupGestureRecognizer() {
    let tapGesutreRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
    searchBar.addGestureRecognizer(tapGesutreRecognizer)
  }
  
  //MARK: - Action
  
  @objc func searchBarTapped() {
    print("클릭 이벤트 발생")
  }
}
