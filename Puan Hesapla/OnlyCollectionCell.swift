//
//  OnlyCollectionCell.swift
//  univerlist
//
//  Created by furkan on 15.11.2019.
//  Copyright © 2019 Furkan Erkorkmaz. All rights reserved.
//

import UIKit

class OnlyCollectionCell: UITableViewCell {

    @IBOutlet weak var collectionTop: NSLayoutConstraint!
    @IBOutlet weak var collectionBottom: NSLayoutConstraint!
     @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.backgroundColor = .clear

    }

}
