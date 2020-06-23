//
//  ArticleCollectionViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(title : String, image : UIImage){
        self.titleLabel.text = title
        self.coverImageView.image = image
    }

}
