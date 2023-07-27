//
//  Case2TableViewController.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/27.
//

import UIKit

class Case2TableViewController: UITableViewController {
  
  // 섹션 데이터
  let sections = [
    Section(title: "전체 설정", rows: ["공지 사항", "실험실", "버전 정보"]),
    Section(title: "개인 설정", rows: ["개인/보안", "알림", "채팅", "멀티프로필"]),
    Section(title: "기타", rows: ["고객센터/도움말"])
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // 섹션 개수
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  // 섹션 별 로우 갯수
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].rows.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].title
  }
  
  // 로우 별 셀 설정
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "case2Cell")!
    
    cell.textLabel?.text = sections[indexPath.section].rows[indexPath.row]
    cell.textLabel?.font = .systemFont(ofSize: 13)
    
    return cell
  }
}
