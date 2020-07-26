//
//  LoginViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth
import Lottie

class LoginViewController: UIViewController {
    
    var width : CGFloat! = 0.0
    var height : CGFloat! = 0.0
    let alertManager = AlertManager()
    
    var titleLabel = UILabel()
    var mailTextField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var pswTextField =  SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var loginButton = UIButton(type: .system)
    var registerButton = UIButton(type: .system)
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.extraLight))
    let starAnimationView = AnimationView(name: K.Resources.Animation.loading)
    
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
        titleLabel.font = UIFont(name: K.Resources.Font.bold, size: 40)
        view.addSubview(titleLabel)
        
        mailTextField.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 32, width: width - 32, height: 45)
        mailTextField.placeholder = "  E-mail"
        mailTextField.title = "  E-mail".lowercased()
        mailTextField.font = UIFont(name: K.Resources.Font.medium, size: 16)
        mailTextField.iconImage = UIImage(systemName: K.Resources.Icon.mail)
        mailTextField.iconColor = .black
        mailTextField.text = "ta@univerlist.com"
        self.view.addSubview(mailTextField)
        
        
        pswTextField.frame = CGRect(x: 16, y: mailTextField.frame.maxY + 32, width: width - 32, height: 45)
        pswTextField.isSecureTextEntry = true
        pswTextField.placeholder = "  Şifre"
        pswTextField.title = "  Şİfre"
        pswTextField.font = UIFont(name: K.Resources.Font.medium, size: 16)
        pswTextField.iconImage = UIImage(named: K.Resources.Icon.password)
        pswTextField.iconColor = .black
        pswTextField.text = "123456"
        self.view.addSubview(pswTextField)
        
        loginButton.frame = CGRect(x: 16, y: pswTextField.frame.maxY + 64, width: width - 32, height: 50)
        loginButton.backgroundColor = .black
        loginButton.setTitle("Giriş yap", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: K.Resources.Font.medium, size: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        registerButton.frame = CGRect(x: 16, y: loginButton.frame.maxY + 32, width: width - 32, height: 30)
        
        registerButton.setTitle("Hesabın yok mu? Kayıt ol", for: .normal)
        registerButton.titleLabel?.font = UIFont(name: K.Resources.Font.medium, size: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        self.view.addSubview(registerButton)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        starAnimationView.stop()
        starAnimationView.removeFromSuperview()
        blurEffectView.removeFromSuperview()
    }

    @objc func login(){

        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
                
        starAnimationView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        starAnimationView.center = self.view.center
        starAnimationView.loopMode = .loop
        self.view.addSubview(starAnimationView)
        starAnimationView.play()
                
        if let email = mailTextField.text, let psw = pswTextField.text {
                   Auth.auth().signIn(withEmail: email, password: psw) { authResult, error in
                    if error != nil {
                        self.viewDidDisappear(true)
                        let alertVC = self.alertManager.alert(errorCode: -1, description: "Email veya şifre" + K.Error.Register.invalidInput)
                            self.present(alertVC, animated: true)
                       }else{
                        let homeVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.home) as! HomeViewController
                        let blogVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.blog) as! BlogViewController
                        let calcVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.calculator) as! CalculatorViewController
                        let tabBarController = UITabBarController()
                        let navController = UINavigationController()
                        navController.viewControllers = [blogVC]
                        navController.navigationBar.prefersLargeTitles = true
                        tabBarController.viewControllers = [homeVC, navController, calcVC]
                        tabBarController.tabBar.barTintColor = .white
                        tabBarController.tabBar.tintColor = UIColor(named: K.Resources.Color.blue)
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.show(tabBarController, sender: self)
                       }
                   }
        }
    }
    @objc func register(){
        let registerVC =  UIStoryboard(name: K.SB.main, bundle: .main).instantiateViewController(withIdentifier: K.VC.register) as! RegisterViewController
        self.present(registerVC,animated: true)
    }
}
