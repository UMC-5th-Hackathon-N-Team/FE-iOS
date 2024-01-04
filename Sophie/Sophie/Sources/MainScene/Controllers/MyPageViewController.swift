//
//  MyPageViewController.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit
import WebKit

class MyPageViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    private let mainView = MainView()

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        let url = URL(string: "https://fe-web-navy.vercel.app/mypage")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}

private extension MyPageViewController {
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.mainIconImageView)
    }
    
}
