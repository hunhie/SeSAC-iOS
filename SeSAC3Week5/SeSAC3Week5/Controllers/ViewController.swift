//
//  ViewController.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var syncButton: UIButton!
  @IBOutlet var asyncButton: UIButton!
  @IBOutlet var groupButton: UIButton!
  
  @IBOutlet var firstImageView: UIImageView!
  @IBOutlet var secondImageView: UIImageView!
  @IBOutlet var thirdImageView: UIImageView!
  @IBOutlet var fourthImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    syncButton.addTarget(self, action: #selector(syncButtonClicked), for: .touchUpInside)
    asyncButton.addTarget(self, action: #selector(asyncButtonTapped), for: .touchUpInside)
  }
  
  @objc func syncButtonClicked() {
    
    print("sync start")
    downloadImage(imageView: firstImageView, value: "first")
    downloadImage(imageView: secondImageView, value: "second")
    downloadImage(imageView: thirdImageView, value: "third")
    downloadImage(imageView: fourthImageView, value: "fourth")
    print("sync end")
    
  }
  
  @objc func asyncButtonTapped() {
    print("async start")
    asyncDownloadImage(imageView: firstImageView, value: "first")
    asyncDownloadImage(imageView: secondImageView, value: "second")
    asyncDownloadImage(imageView: thirdImageView, value: "third")
    asyncDownloadImage(imageView: fourthImageView, value: "fourth")
    print("async end")
  }
  
  func downloadImage(imageView: UIImageView, value: String) {
    
    print("===start===\(value)===")
    let data = try! Data(contentsOf: Nasa.photo)
    imageView.image = UIImage(data: data)
    print("===end===\(value)===")
    
  }
  
  func asyncDownloadImage(imageView: UIImageView, value: String) {
    
    print("===1===\(value)===", Thread.isMainThread)
    DispatchQueue.global().async {
      print("===2-1===\(value)===", Thread.isMainThread)
      let data = try! Data(contentsOf: Nasa.photo)
      DispatchQueue.main.async {
        imageView.image = UIImage(data: data)
        print("===2-2===\(value)===", Thread.isMainThread)
      }
      print("===2-3===\(value)===", Thread.isMainThread)
    }
    print("===3===\(value)===", Thread.isMainThread)
  }
  
}

