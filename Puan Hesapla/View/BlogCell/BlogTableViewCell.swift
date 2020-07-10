//
//  BlogTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 8.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleView.layer.borderWidth = 0.2
        articleView.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
