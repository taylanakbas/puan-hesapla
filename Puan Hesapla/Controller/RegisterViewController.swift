//
//  RegisterViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class RegisterViewController: UIViewController {
    
    var width : CGFloat! = 0.0
    var height : CGFloat! = 0.0
    let alertManager = AlertManager()
    let db = Firestore.firestore()

    
    var titleLabel = UILabel()
    var mailTextField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var pswTextField =  SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var phoneTextField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
    var stackView1 = UIStackView()
    var stackView2 = UIStackView()
    var switchLabel1 = UILabel()
    var switchOnOff1 = UISwitch()
    var switchLabel2 = UILabel()
    var switchOnOff2 = UISwitch()
    var registerButton = UIButton(type: .system)
    
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
        titleLabel.text = "Kayıt ol"
        titleLabel.font = UIFont(name: K.Resources.Font.bold, size: 40)
        view.addSubview(titleLabel)
        
        
        mailTextField.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 16, width: width - 32, height: 45)
        mailTextField.placeholder = "  E-mail"
        mailTextField.title = "  E-mail adresİnİz:".lowercased()
        
        mailTextField.font = UIFont(name: K.Resources.Font.medium, size: 16)
        mailTextField.iconImage = UIImage(systemName: K.Resources.Icon.mail)
        mailTextField.iconColor = .black
        mailTextField.addTarget(self, action: #selector(RegisterViewController.emailFieldDidChange(_:)), for: .editingChanged)

        self.view.addSubview(mailTextField)
        
        
        pswTextField.frame = CGRect(x: 16, y: mailTextField.frame.maxY + 32, width: width - 32, height: 45)
        pswTextField.isSecureTextEntry = true
        pswTextField.placeholder = "  Şifre"
        pswTextField.title = "  Şifrenİz:"
        pswTextField.font = UIFont(name: K.Resources.Font.medium, size: 16)
        pswTextField.iconImage = UIImage(named: K.Resources.Icon.password)
        pswTextField.addTarget(self, action: #selector(RegisterViewController.passwordFieldDidChange(_:)), for: .editingChanged)
        self.view.addSubview(pswTextField)
        
        phoneTextField.frame = CGRect(x: 16, y: pswTextField.frame.maxY + 32, width: width - 32, height: 45)
        phoneTextField.placeholder = "  Telefon (İsteğe bağlı)"
        phoneTextField.title = "  Telefon numaranız:"
        phoneTextField.font = UIFont(name: K.Resources.Font.medium, size: 16)
        phoneTextField.iconImage = UIImage(systemName: K.Resources.Icon.phone)
        phoneTextField.iconColor = .black
        phoneTextField.keyboardType = .phonePad
        phoneTextField.delegate = self
        self.view.addSubview(phoneTextField)
        
        
        stackView1.axis = .horizontal
        stackView1.alignment = .center
        stackView1.distribution = .equalSpacing
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.spacing = 0.0
        
        switchLabel1.textAlignment = .left
        switchLabel1.numberOfLines = 0
        switchLabel1.textColor = .black
        switchLabel1.text = "Kayıt olup devam etmeniz durumunda gizlilik sözleşmemizi kabul etmiş sayılırsınız."
        switchLabel1.font = UIFont(name: K.Resources.Font.regular, size: 16)
        switchLabel1.adjustsFontSizeToFitWidth = true
        switchLabel1.translatesAutoresizingMaskIntoConstraints = false

        switchOnOff1.setOn(true, animated: false)
        switchOnOff1.translatesAutoresizingMaskIntoConstraints = false
        switchOnOff1.onTintColor = UIColor(named: K.Resources.Color.blue)!
        
        stackView1.addArrangedSubview(switchLabel1)
        stackView1.addArrangedSubview(switchOnOff1)
        self.view.addSubview(stackView1)
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 48),
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            switchLabel1.widthAnchor.constraint(equalToConstant: width - 100),
        ])
        
        stackView2.axis = .horizontal
        stackView2.alignment = .center
        stackView2.distribution = .equalSpacing
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.spacing = 0.0
        
        switchLabel2.textAlignment = .left
        switchLabel2.numberOfLines = 0
        switchLabel2.textColor = .black
        switchLabel2.text = "Üniversiteler tarafından bilgilendirme aramaları ve sms almak istiyorum."
        switchLabel2.font = UIFont(name: K.Resources.Font.medium, size: 16)
        switchLabel2.adjustsFontSizeToFitWidth = true
        switchLabel2.translatesAutoresizingMaskIntoConstraints = false

        switchOnOff2.setOn(true, animated: false)
        switchOnOff2.translatesAutoresizingMaskIntoConstraints = false
        switchOnOff2.onTintColor = UIColor(named: K.Resources.Color.blue)!

        stackView2.addArrangedSubview(switchLabel2)
        stackView2.addArrangedSubview(switchOnOff2)
        self.view.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 32),
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            switchLabel2.widthAnchor.constraint(equalToConstant: width - 100),
        ])

        registerButton.frame = CGRect(x: 16, y: phoneTextField.frame.maxY + 256, width: width - 32, height: 50)
        registerButton.backgroundColor = .black
        registerButton.setTitle("Kayıt ol", for: .normal)
        registerButton.titleLabel?.font = UIFont(name: K.Resources.Font.medium, size: 18)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        self.view.addSubview(registerButton)
    }
    
    @objc func register(){
        if switchOnOff1.isOn {
            if  mailTextField.text != nil && mailTextField.text != "" {
                let email = mailTextField.text!
                if pswTextField.text != nil && pswTextField.text != "" {
                   let psw = pswTextField.text!
                    Auth.auth().createUser(withEmail: email, password: psw) { authResult, error in
                       guard let _ = authResult?.user, error == nil else {
                        let alertVC = self.alertManager.alert(errorCode: -1, description: K.Error.Register.error)
                           self.present(alertVC, animated: true)
                           return
                     }
                       let phone = self.phoneTextField.text ?? ""
                        self.db.collection(K.FStore.user.collectionName)
                           .addDocument(data: [
                                K.FStore.user.emailField : email,
                                K.FStore.user.phoneField : phone,
                                K.FStore.user.isSubscribed : self.switchOnOff2.isOn
                       ]){ (err) in
                        if err != nil{
                            let alertVC = self.alertManager.alert(errorCode: -1, description: K.Error.Register.error)
                            self.present(alertVC, animated: true)
                        }
                       }
                        let loginVC =  UIStoryboard(name: K.SB.main, bundle: .main).instantiateViewController(withIdentifier: K.VC.login) as! LoginViewController
                        self.present(loginVC,animated: true)
                    }
                }else {
                    let alertVC = alertManager.alert(errorCode: -1, description: "Şifre" + K.Error.Register.invalidInput)
                    self.present(alertVC, animated: true)
                }
            }else {
                let alertVC = alertManager.alert(errorCode: -1, description: "E-mail" + K.Error.Register.invalidInput)
                self.present(alertVC, animated: true)
            }
        }else {
            let alertVC = alertManager.alert(errorCode: -1, description: K.Error.Register.switchOff)
            self.present(alertVC, animated: true)
        }
    }
    @objc func emailFieldDidChange(_ textField: UITextField) {
        if textField.text!.count < 3 || !(textField.text?.contains("@"))!{
            self.mailTextField.title = K.Error.Register.invalidEmail
            self.mailTextField.selectedTitleColor = .red
        }else {
            self.mailTextField.title = "  E-mail"
            self.mailTextField.selectedTitleColor = UIColor(named: K.Resources.Color.blue)!
        
        }
    }
    @objc func passwordFieldDidChange(_ textField: UITextField) {
        if textField.text!.count < 8 {
            self.pswTextField.title = K.Error.Register.invalidPassword
            self.pswTextField.selectedTitleColor = .red
        }else {
            self.pswTextField.title = "  Şİfre:"
            self.pswTextField.selectedTitleColor = UIColor(named: K.Resources.Color.blue)!
        }
    }
}

extension RegisterViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.phoneTextField {
            guard let text = textField.text else { return true }
             let newLength = text.count + string.count - range.length
             return newLength <= 11
        }
        return true
    }
}
