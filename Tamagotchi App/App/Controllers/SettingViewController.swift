//
//  SettingViewController.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/05.
//

import UIKit

final class SettingViewController: UIViewController {
  
  // MARK: - Properties
  
  static let identifier = "SettingViewController"
  
  @IBOutlet weak var settingTableView: UITableView!

  lazy var menuList: [Menu] = [
    Menu(name: "내 이름 설정하기", image: "pencil", detail: User.shared.name, type: .push(SettingNameViewController.identifier)),
    Menu(name: "다마고치 변경하기", image: "moon.fill", type: .push("")),
    Menu(name: "데이터 초기화", image: "arrow.clockwise", type: .alert)
  ]
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    configureUI()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    
    view.backgroundColor = ColorConstant.backgroundColor
    
    self.title = StringConstant.setting
    let titleLabel = UILabel()
    titleLabel.text = StringConstant.setting
    titleLabel.textColor = ColorConstant.textColor
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
    navigationItem.titleView = titleLabel
    
    setupNavigationBar()
    setupSettingTableView()
  }
  
  func setupNavigationBar() {
    
    navigationController?.navigationBar.topItem?.title = ""
    navigationController?.navigationBar.tintColor = ColorConstant.textColor
  }
  
  func setupSettingTableView() {
    
    settingTableView.backgroundColor = ColorConstant.backgroundColor
    settingTableView.delegate = self
    settingTableView.dataSource = self
    
    let nib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
    settingTableView.register(nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
  }
  
  
  // MARK: - Constraints
  
  // MARK: - IBActions
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let menu = menuList[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else {
      return UITableViewCell()
    }
    
    cell.menu = menu
    cell.configureCell()
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch menuList[indexPath.row].type {
    case .alert:
      print()
    case .push(let identifier):
      guard let vc = storyboard?.instantiateViewController(identifier: identifier) else { return }
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
