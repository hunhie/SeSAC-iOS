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
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    settingTableView.reloadData()
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
    return Menu.MenuList().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let menu =  Menu.MenuList()[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else {
      return UITableViewCell()
    }
    
    cell.menu = menu
    cell.configureCell()
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch Menu.MenuList()[indexPath.row].type {
    case .alert:
      let alertController = UIAlertController(title: StringConstant.resetAlertTitle, message: StringConstant.resetAlertMessage, preferredStyle: .alert)
      let cancel = UIAlertAction(title: "취소", style: .cancel)
      let done = UIAlertAction(title: "초기화", style: .destructive) { _ in
        
        TamagotchiManager.shared.resetData()
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: TamagotchiSelectViewController.identifier) else { return }
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
      }
      alertController.addAction(cancel)
      alertController.addAction(done)
      present(alertController, animated: true)
    case .push(let identifier):
      guard let vc = storyboard?.instantiateViewController(identifier: identifier) else { return }
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
