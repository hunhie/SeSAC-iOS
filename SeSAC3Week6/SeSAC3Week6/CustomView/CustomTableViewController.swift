//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
  let text: String
  var isExpand: Bool
}

class CustomTableViewController: UIViewController {
  
  let tableView = {
    let view = UITableView()
    view.rowHeight = UITableView.automaticDimension   // 셀 높이 유동적으로 설정
    return view
  }()
  
  var sampleList: [Sample] = [
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
    Sample(text: "텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 텍스트 셀 ", isExpand: false),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    view.addSubview(tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
  }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sampleList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
    cell.textLabel?.text = sampleList[indexPath.row].text
    cell.textLabel?.numberOfLines = sampleList[indexPath.row].isExpand ? 0 : 2
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    sampleList[indexPath.row].isExpand.toggle()
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
}

