//
//  WebViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 6.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: self.url)!)
        webView.load(request)
    }
}
extension WebViewController : WKUIDelegate {
    override func loadView() {
       let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        view = self.webView
    }
}

