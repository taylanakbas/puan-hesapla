//
//  CalculateAYTTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class CalculateAYTTableViewCell: UITableViewCell {
    
    @IBOutlet weak var EDBTrue: UITextField!
    @IBOutlet weak var MATHTrue: UITextField!
    @IBOutlet weak var SOTrue: UITextField!
    @IBOutlet weak var SCTrue: UITextField!
    @IBOutlet weak var GRTrue: UITextField!
    @IBOutlet weak var EDBFalse: UITextField!
    @IBOutlet weak var MATHFalse: UITextField!
    @IBOutlet weak var SOFalse: UITextField!
    @IBOutlet weak var SCFalse: UITextField!
    @IBOutlet weak var GRFalse: UITextField!
    @IBOutlet weak var diplomaGrade: UITextField!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        EDBTrue.delegate = self
        MATHTrue.delegate = self
        SOTrue.delegate = self
        SCTrue.delegate = self
        EDBFalse.delegate = self
        MATHFalse.delegate = self
        SOFalse.delegate = self
        SCFalse.delegate = self
        diplomaGrade.delegate = self
        
        checkBoxButton.setImage(UIImage(named: "checkboxEmpty.png"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "checkbox.png"), for: .selected)
        
    }
    @IBAction func checkBoxTapped(_ sender: Any) {
        if checkBoxButton.isSelected {
            checkBoxButton.imageView?.image = UIImage(named: "checkbox")
            checkBoxButton.isSelected = false
        }else {
            checkBoxButton.imageView?.image = UIImage(named: "checkboxEmpty")
            checkBoxButton.isSelected = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CalculateAYTTableViewCell : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.EDBTrue && Int(self.EDBTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.EDBTrue.text ?? "40")
            EDBFalse.placeholder = String(40 - i!)
        }else if textField == self.MATHTrue && Int(self.MATHTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.MATHTrue.text ?? "40")
            MATHFalse.placeholder = String(40 - i!)
        }else if textField == self.SOTrue && Int(self.SOTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.SOTrue.text ?? "40")
            SOFalse.placeholder = String(40 - i!)
        }else if textField == self.SCTrue && Int(self.SCTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.SCTrue.text ?? "40")
            SCFalse.placeholder = String(40 - i!)
        }else if textField == self.GRTrue && Int(self.SCTrue.text ?? "80") ?? 0 <= 80 && textField.text != "" {
            let i = Int(self.GRTrue.text ?? "80")
            GRFalse.placeholder = String(80 - i!)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.diplomaGrade {
            return digitLimit(existing: textField.text ?? "", new: string, limit: 3)
        }else{
            return digitLimit(existing: textField.text ?? "", new: string, limit: 2)
        }
    }
    func digitLimit(existing : String, new : String, limit : Int) -> Bool{
        let text = existing
        return text.count + new.count <= limit
    }
}

