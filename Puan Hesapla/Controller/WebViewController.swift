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
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: self.url)!)
        self.webView.scrollView.bouncesZoom = false;
        self.webView.isMultipleTouchEnabled = false
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48.0).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        webView.load(request)

    }
}
extension WebViewController : WKUIDelegate {
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero , configuration: webConfiguration)
        self.webView.uiDelegate = self
        view = self.webView
    }
}

