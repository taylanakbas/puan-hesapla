//
//  AlertManager.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 30.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class AlertManager {
    func alert(errorCode : Int) -> AlertViewController {
    
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController

        if errorCode <= 10 {
            let content = CalculatorAlert(body: "\(K.Error.Calc.tyt[errorCode]!) Doğru/Yanlış sonuçlarınızı kontrol ediniz!")
            alertVC.alertTitle = content.title
            alertVC.alertBody = content.body
            alertVC.buttonTitle = content.buttonTitle
        }else{
            let content = CalculatorAlert(body: "\(K.Error.Calc.ayt[errorCode]!) Doğru/Yanlış sonuçlarınızı kontrol ediniz!")
            alertVC.alertTitle = content.title
            alertVC.alertBody = content.body
            alertVC.buttonTitle = content.buttonTitle
        }
        return alertVC
    }
}

class CalculatorAlert {
    let title : String
    var body : String
    let buttonTitle : String
    internal init(body : String) {
        self.title = "Uyarı"
        self.body = body
        self.buttonTitle = "Tamam"
    }
}
