//
//  UniversityTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 23.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class UniversityTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
