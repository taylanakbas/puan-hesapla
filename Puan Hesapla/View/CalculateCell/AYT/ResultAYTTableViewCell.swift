//
//  ResultAYTTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class ResultAYTTableViewCell: UITableViewCell {


    @IBOutlet weak var EA_Ham: UILabel!
    @IBOutlet weak var SOZ_Ham: UILabel!
    @IBOutlet weak var SAY_Ham: UILabel!
    @IBOutlet weak var YDIL_Ham: UILabel!
    @IBOutlet weak var EA_Yer: UILabel!
    @IBOutlet weak var SOZ_Yer: UILabel!
    @IBOutlet weak var SAY_Yer: UILabel!
    @IBOutlet weak var YDIL_Yer: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
