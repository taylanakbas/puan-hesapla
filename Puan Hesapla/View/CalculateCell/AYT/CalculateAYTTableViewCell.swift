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

    
    @IBOutlet weak var EDBNet: UILabel!
    @IBOutlet weak var SONet: UILabel!
    @IBOutlet weak var MATHNet: UILabel!
    @IBOutlet weak var SCNet: UILabel!
    @IBOutlet weak var GRNet: UILabel!
    var ayt = AYTResult()
    
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
        GRTrue.delegate = self
        GRFalse.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CalculateAYTTableViewCell : UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.saveContent(textField)
        self.changePlaceholder(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return digitLimit(existing: textField.text ?? "", new: string, limit: 2)
    }
    func digitLimit(existing : String, new : String, limit : Int) -> Bool{
        let text = existing
        return text.count + new.count <= limit
    }
    func saveContent(_ textField : UITextField){
        switch textField {
        case EDBTrue:
            self.ayt.tdT = checkEmpty(self.EDBTrue.text ?? "0")
        case EDBFalse:
            self.ayt.tdF = checkEmpty(self.EDBFalse.text ?? "0")
        case MATHTrue:
            self.ayt.matT = checkEmpty(self.MATHTrue.text ?? "0")
        case MATHFalse:
            self.ayt.matF = checkEmpty(self.MATHFalse.text ?? "0")
        case SCTrue:
            self.ayt.fenT = checkEmpty(self.SCTrue.text ?? "0")
        case SCFalse:
            self.ayt.fenF = checkEmpty(self.SCFalse.text ?? "0")
        case SOTrue:
            self.ayt.sosT = checkEmpty(self.SOTrue.text ?? "0")
        case SOFalse:
            self.ayt.sosF = checkEmpty(self.SOFalse.text ?? "0")
        case GRTrue:
            self.ayt.ydT = checkEmpty(self.GRTrue.text ?? "0")
        case GRFalse:
            self.ayt.ydF = checkEmpty(self.GRFalse.text ?? "0")
        default:
            return
        }
    }
    func checkEmpty(_ str : String) -> String{
        if str == "" || str == "00" || str == "000" { return "0" }
        else { return str }
    }
    func changePlaceholder(_ textField : UITextField) {
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
        }else if textField == self.GRTrue && Int(self.GRTrue.text ?? "80") ?? 0 <= 80 && textField.text != "" {
            let i = Int(self.GRTrue.text ?? "80")
            GRFalse.placeholder = String(80 - i!)
        }
    }
}

