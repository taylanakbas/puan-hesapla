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
        webView.load(request)

    }
    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}


