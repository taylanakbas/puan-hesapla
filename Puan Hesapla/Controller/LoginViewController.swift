//
//  LoginViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    var width : CGFloat! = 0.0
    var height : CGFloat! = 0.0
    
    var titleLabel = UILabel()
    var mailTextField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var pswTextField =  SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var loginButton = UIButton()
    var registerButton = UIButton()
    
    override func viewDidLayoutSubviews() {
        width = view.frame.size.width
        height = view.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLayoutSubviews()
        self.hideKeyboardWhenTappedAround()
        
        titleLabel.frame = CGRect(x: 16, y: 32, width: width - 32, height: 50)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.text = "Giriş Yap"
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 40)
        view.addSubview(titleLabel)
        
        mailTextField.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 32, width: width - 32, height: 45)
        mailTextField.placeholder = "  E-mail"
        mailTextField.title = "  E-mail adresİnİz:".lowercased()
        mailTextField.font = UIFont(name: "Montserrat-Medium", size: 16)
        mailTextField.iconImage = UIImage(systemName: "envelope")
        self.view.addSubview(mailTextField)
        
        
        pswTextField.frame = CGRect(x: 16, y: mailTextField.frame.maxY + 32, width: width - 32, height: 45)
        pswTextField.isSecureTextEntry = true
        pswTextField.placeholder = "  Şifre"
        pswTextField.title = "  Şifrenİz:"
        pswTextField.font = UIFont(name: "Montserrat-Medium", size: 16)
        pswTextField.iconImage = UIImage(named: "password")
        self.view.addSubview(pswTextField)
        
        loginButton.frame = CGRect(x: 16, y: pswTextField.frame.maxY + 64, width: width - 32, height: 50)
        loginButton.backgroundColor = .black
        loginButton.setTitle("Giriş yap", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        registerButton.frame = CGRect(x: 16, y: loginButton.frame.maxY + 32, width: width - 32, height: 30)
        
        registerButton.setTitle("Hesabın yok mu? Kayıt ol", for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(registerButton)

    }
    @objc func login(){
        print("Logged in")
    }
    
}
