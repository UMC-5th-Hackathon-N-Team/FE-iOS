//
//  GiftViewController.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit
import WebKit

class GiftViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://fe-web-navy.vercel.app/gift")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}
