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
            let cell = Bundle.main.loadNibNamed("CalculateTableViewCell", owner: self, options: nil)?.first as! CalculateTableViewCell
            return cell
        }else if indexPath.section == 2 {
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.seeAllButton.isHidden = true
            cell.seeAllButton.isEnabled = false
            cell.titleLabel.text = "AYT Puan"
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed("CalculateTableViewCell", owner: self, options: nil)?.first as! CalculateTableViewCell
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat = 0.0
        if indexPath.section == 0 || indexPath.section == 2 { height = 80.0 }
        else if indexPath.section == 1 || indexPath.section == 3 { height = 340.0 }
        return height
    }
}
