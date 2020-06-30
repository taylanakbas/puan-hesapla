//
//  CalculateTYTTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 28.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class CalculateTYTTableViewCell: UITableViewCell {

    @IBOutlet weak var TRTrue: UITextField!
    @IBOutlet weak var MATHTrue: UITextField!
    @IBOutlet weak var SOTrue: UITextField!
    @IBOutlet weak var SCTrue: UITextField!
    @IBOutlet weak var TRFalse: UITextField!
    @IBOutlet weak var MATHFalse: UITextField!
    @IBOutlet weak var SOFalse: UITextField!
    @IBOutlet weak var SCFalse: UITextField!
    @IBOutlet weak var diplomaGrade: UITextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var TRNet: UILabel!
    @IBOutlet weak var MATHNet: UILabel!
    @IBOutlet weak var SONet: UILabel!
    @IBOutlet weak var SCNet: UILabel!
    
    var tyt = TYTResult()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TRTrue.delegate = self
        MATHTrue.delegate = self
        SOTrue.delegate = self
        SCTrue.delegate = self
        TRFalse.delegate = self
        MATHFalse.delegate = self
        SOFalse.delegate = self
        SCFalse.delegate = self
        diplomaGrade.delegate = self
        self.setupView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupView(){
        checkBoxButton.setImage(UIImage(named: "checkboxEmpty.png"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "checkbox.png"), for: .selected)
    }
    @IBAction func checkBoxTapped(_ sender: Any) {
        if checkBoxButton.isSelected {
            checkBoxButton.imageView?.image = UIImage(named: "checkbox")
            checkBoxButton.isSelected = false
            self.tyt.check = checkBoxButton.isSelected
        }else {
            checkBoxButton.imageView?.image = UIImage(named: "checkboxEmpty")
            checkBoxButton.isSelected = true
            self.tyt.check = checkBoxButton.isSelected
        }
    }
}
extension CalculateTYTTableViewCell : UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        saveContent(textField)
        changePlaceholder(textField)
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
    func saveContent(_ textField: UITextField){
        self.tyt.check = self.checkBoxButton.isSelected
        switch textField {
        case TRTrue:
            self.tyt.trT = checkEmpty(self.TRTrue.text ?? "0")
        case TRFalse:
            self.tyt.trF = checkEmpty(self.TRFalse.text ?? "0")
        case MATHTrue:
            self.tyt.matT = checkEmpty(self.MATHTrue.text ?? "0")
        case MATHFalse:
            self.tyt.matF = checkEmpty(self.MATHFalse.text ?? "0")
        case SCTrue:
            self.tyt.fenT = checkEmpty(self.SCTrue.text ?? "0")
        case SCFalse:
            self.tyt.fenF = checkEmpty(self.SCFalse.text ?? "0")
        case SOTrue:
            self.tyt.sosT = checkEmpty(self.SOTrue.text ?? "0")
        case SOFalse:
            self.tyt.sosF = checkEmpty(self.SOFalse.text ?? "0")
        case diplomaGrade:
            self.tyt.diplomaGrade = checkEmpty(self.diplomaGrade.text ?? "0")
        default:
            return
        }
    }
    func checkEmpty(_ str : String) -> String{
        if str == "" || str == "00" || str == "000" { return "0" }
        else { return str }
    }
    func changePlaceholder(_ textField : UITextField){
        if textField == self.TRTrue && Int(self.TRTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.TRTrue.text ?? "40")
            TRFalse.placeholder = String(40 - i!)
        }else if textField == self.MATHTrue && Int(self.MATHTrue.text ?? "40") ?? 0 <= 40 && textField.text != "" {
            let i = Int(self.MATHTrue.text ?? "40")
            MATHFalse.placeholder = String(40 - i!)
        }else if textField == self.SOTrue && Int(self.SOTrue.text ?? "20") ?? 0 <= 20 && textField.text != "" {
            let i = Int(self.SOTrue.text ?? "20")
            SOFalse.placeholder = String(20 - i!)
        }else if textField == self.SCTrue && Int(self.SCTrue.text ?? "20") ?? 0 <= 20 && textField.text != "" {
            let i = Int(self.SCTrue.text ?? "20")
            SCFalse.placeholder = String(20 - i!)
        }
    }
}
