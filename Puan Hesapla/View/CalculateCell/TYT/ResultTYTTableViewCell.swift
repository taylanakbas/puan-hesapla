//
//  ResultTYTTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class ResultTYTTableViewCell: UITableViewCell {

    @IBOutlet weak var hamGrade: UILabel!
    @IBOutlet weak var yerGrade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}