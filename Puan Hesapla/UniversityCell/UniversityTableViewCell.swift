//
//  UniversityTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class UniversityTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    override func awakeFromNib() {

        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UniversityCollectionViewCell", for: indexPath) as?  UniversityCollectionViewCell
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = indexPath.row
        collectionView.reloadData()
        return cell!
    }
}
