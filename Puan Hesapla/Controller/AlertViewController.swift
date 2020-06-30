//
//  AlertViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 30.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var alertTitle = String()
    var alertBody = String()
    var buttonTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        titleLabel.text = alertTitle
        bodyLabel.text = alertBody
        actionButton.setTitle(buttonTitle, for: .normal)
    }
    @IBAction func didTapAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
