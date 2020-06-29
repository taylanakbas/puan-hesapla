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
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()


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


extension CalculatorViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "TYT Puan"
            
            return cell
        }else if indexPath.section == 1 {
            let cell = Bundle.main.loadNibNamed("CalculateTYTTableViewCell", owner: self, options: nil)?.first as! CalculateTYTTableViewCell
            return cell
        }else if indexPath.section == 2 {
            let cell = Bundle.main.loadNibNamed("ResultTYTTableViewCell", owner: self, options: nil)?.first as! ResultTYTTableViewCell
            return cell
        }else if indexPath.section == 3 {
            
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "AYT Puan"
            return cell
        }
        else if indexPath.section == 4 {
            let cell = Bundle.main.loadNibNamed("CalculateAYTTableViewCell", owner: self, options: nil)?.first as! CalculateAYTTableViewCell
            return cell
        }else if indexPath.section == 5 {
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "AYT Sonuç"
            return cell

        }else if indexPath.section == 6{
            let cell = Bundle.main.loadNibNamed("ResultAYTTableViewCell", owner: self, options: nil)?.first as! ResultAYTTableViewCell
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed("CalculateButtonTableViewCell", owner: self, options: nil)?.first as! CalculateButtonTableViewCell
            //cell.calculateButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80.0
        case 1:
            return 400.0
        case 2:
            return 150.0
        case 3:
            return 80.0
        case 4:
            return 400.0
        case 5:
            return 80.0
        case 6:
            return 200.0
        case 7:
            return 60.0
        default:
            return 80.0
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
}
