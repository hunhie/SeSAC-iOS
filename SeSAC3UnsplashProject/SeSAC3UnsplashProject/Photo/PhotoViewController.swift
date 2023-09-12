//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import UIKit
import Kingfisher

final class PhotoViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel = PhotoViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 80
    
    viewModel.fetchPhoto()
    viewModel.list.bind { _ in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.rowCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")!
    let data = viewModel.cellForRowAt(at: indexPath)
    cell.imageView?.kf.setImage(with: URL(string: data.urls.thumb))
    cell.layoutIfNeeded()
    return cell
  }
}
