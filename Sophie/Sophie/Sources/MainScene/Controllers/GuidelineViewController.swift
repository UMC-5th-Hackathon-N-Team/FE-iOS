//
//  GuidelineViewController.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit
import WebKit

class GuidelineViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.bloodinfo.net/knrcbs/cm/cntnts/cntntsView.do?mi=1048&cntntsId=1124")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}
