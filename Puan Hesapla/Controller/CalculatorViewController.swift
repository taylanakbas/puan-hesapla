//
//  CalculatorViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tytCell = CalculateTYTTableViewCell()
    var aytCell = CalculateAYTTableViewCell()
    
    var tytResult = TYTIntResult()
    var aytResult = AYTIntResult()
    
    let alertManager = AlertManager()
    
    var reloadFlagTYT : Bool = false
    var reloadFlagAYT : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.items?[2].title = ""
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.items?[2].title = "Puan Hesaplama"
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @objc func calculate(){
    
        
        var tyt = TYTParse(result: self.tytCell.tyt)
        var ayt =  AYTParse(result: self.aytCell.ayt)
        let e1 = tyt.parseToInt()
        let e2 = ayt.parseToInt()
        
        if e1 == 0 && e2 == 0{
            // Success
            tytResult = Calculator(tyt.intResult,ayt.intResult).tyt
            aytResult = Calculator(tyt.intResult,ayt.intResult).ayt
            tableView.setContentOffset(.zero, animated:true)
        }else{
            // Error
            if e1 != 0 {
                let alertVC = alertManager.alert(errorCode: e1)
                self.present(alertVC, animated: true)
                tableView.setContentOffset(.zero, animated:true)
            }else{
                let alertVC = alertManager.alert(errorCode: e2)
                self.present(alertVC, animated: true)
            }
        }
    }
}


extension CalculatorViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.title, owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "TYT Puan"
            cell.titleLabel.textColor = .white
            cell.view.backgroundColor = UIColor(named: K.Resources.Color.purple)
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.frame
            rectShape.position = cell.center
            rectShape.path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            cell.layer.mask = rectShape
            return cell
        }else if indexPath.section == 1 {
            var cell = Bundle.main.loadNibNamed(K.XIB.Table.tyt, owner: self, options: nil)?.first as! CalculateTYTTableViewCell
                if !reloadFlagTYT {
                    self.tytCell = cell
                    self.reloadFlagTYT = true
                } else {
                    cell = self.tytCell
                }
                cell.TRNet.text = String(format: "%.2f", tytResult.trNet)
                cell.MATHNet.text = String(format: "%.2f", tytResult.matNet)
                cell.SONet.text = String(format: "%.2f", tytResult.sosNet)
                cell.SCNet.text = String(format: "%.2f", tytResult.fenNet)
                return cell
        }else if indexPath.section == 2 {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.title, owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "TYT Sonuç"
            cell.titleLabel.textColor = .white
            cell.backgroundColor = UIColor(named: K.Resources.Color.purple)
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.frame
            rectShape.position = cell.center
            rectShape.path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft , .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            cell.layer.mask = rectShape
            return cell
        }else if indexPath.section == 3 {
            
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.tytResult, owner: self, options: nil)?.first as! ResultTYTTableViewCell
            cell.hamGrade.text = String(format:"%.1f", tytResult.hamGrade)
            cell.yerGrade.text = String(format:"%.1f", tytResult.yerGrade)
            return cell
            
        }
        else if indexPath.section == 4 {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.title, owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "AYT Puan"
            cell.titleLabel.textColor = .white
            cell.backgroundColor = UIColor(named: K.Resources.Color.lightBlue)
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.frame
            rectShape.position = cell.center
            rectShape.path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft , .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            cell.layer.mask = rectShape
            return cell
            
        }else if indexPath.section == 5 {
            
            var cell = Bundle.main.loadNibNamed(K.XIB.Table.ayt, owner: self, options: nil)?.first as! CalculateAYTTableViewCell
            if !reloadFlagAYT {
                self.aytCell = cell
                self.reloadFlagAYT = true
            }else {
                cell = self.aytCell
            }
            cell.EDBNet.text = String(format: "%.2f", aytResult.tdNet)
            cell.MATHNet.text = String(format: "%.2f", aytResult.matNet)
            cell.SONet.text = String(format: "%.2f", aytResult.sosNet)
            cell.SCNet.text = String(format: "%.2f", aytResult.fenNet)
            cell.GRNet.text = String(format: "%.2f", aytResult.ydNet)
            return cell
        }else if indexPath.section == 6{
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.title, owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "AYT Sonuç"
            cell.titleLabel.textColor = .white
            cell.backgroundColor = UIColor(named: K.Resources.Color.lightBlue)
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.frame
            rectShape.position = cell.center
            rectShape.path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft , .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            cell.layer.mask = rectShape
            return cell
        }else if indexPath.section == 7 {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.aytResult, owner: self, options: nil)?.first as! ResultAYTTableViewCell
            cell.EA_Ham.text = String(format:"%.1f", aytResult.eaHam)
            cell.SOZ_Ham.text = String(format:"%.1f", aytResult.sozHam)
            cell.SAY_Ham.text = String(format:"%.1f", aytResult.sayHam)
            cell.YDIL_Ham.text = String(format:"%.1f", aytResult.ydilHam)
            cell.EA_Yer.text = String(format:"%.1f", aytResult.eaYer)
            cell.SOZ_Yer.text = String(format:"%.1f", aytResult.sozYer)
            cell.SAY_Yer.text = String(format:"%.1f", aytResult.sayYer)
            cell.YDIL_Yer.text = String(format:"%.1f", aytResult.ydilYer)
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.calculate, owner: self, options: nil)?.first as! CalculateButtonTableViewCell
            cell.calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return K.XIB.Table.titleHeight
        case 1:
            return K.XIB.Table.tytHeight
        case 2:
            return K.XIB.Table.titleHeight
        case 3:
            return K.XIB.Table.tytResultHeight
        case 4:
            return K.XIB.Table.titleHeight
        case 5:
            return K.XIB.Table.aytHeight
        case 6:
            return K.XIB.Table.titleHeight
        case 7:
            return K.XIB.Table.aytResultHeight
        case 8:
            return K.XIB.Table.calculateHeight
        default:
            return 0.0
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= (keyboardSize.height / 2)
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
