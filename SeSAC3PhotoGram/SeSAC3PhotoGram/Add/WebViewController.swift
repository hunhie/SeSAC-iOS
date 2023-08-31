//
//  WebViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
  
  var webView: WKWebView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
  
//  override func loadView() {
//    let webConfiguration = WKWebViewConfiguration()
//    webView = WKWebView(frame: .zero, configuration: webConfiguration)
//    webView.uiDelegate = self
//    view = webView
//  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(webView)
    webView.snp.makeConstraints { make in
      make.edges.equalTo(view).inset(10)
    }
    
    let myURL = URL(string:"https://www.naver.com")
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
    
    title = "이건 웹뷰데스"
    
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .red
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    navigationController?.navigationBar.standardAppearance = appearance
  }
  
  func reloadButtonTapped() {
    webView.reload()
  }
  
  func goBackButtonTapped() {
    if webView.canGoBack {
      webView.goBack()
    }
  }
  
  func goForwardButtonClicked() {
    if webView.canGoBack {
      webView.goForward()
    }
  }
}
