//
//  MainViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 19.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var universityCollectionView: UICollectionView!
    @IBOutlet weak var blogCollectionView: UICollectionView!
    
    @IBOutlet weak var universityTitleLabel: UILabel!
    
    var universities : [University] = []
    let estimatedWidth = 160.0
    let cellMarginSize = 16.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universityCollectionView.delegate = self
        universityCollectionView.dataSource = self
        blogCollectionView.delegate = self
        universityCollectionView.dataSource = self
        
        self.blogCollectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "articleCell")
        self.setupGridView()
        
        initUniversities()
        // Responsive font size 
        self.universityTitleLabel.adjustsFontForContentSizeCategory = true
    }
    func setupGridView(){
        let flow = self.blogCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    func initUniversities(){
        let u0 =  University(name: "Manchester Üniversitesi", location: "Manchester, İngiltere", rate: "9.4", image: UIImage(named: "u0")!)
        let u1 =  University(name: "Bahcesehir Üniversitesi", location: "İstanbul, Türkiye", rate: "8.8", image: UIImage(named: "u1")!)
        let u2 =  University(name: "Liverpool Üniversitesi", location: "Liverpool, İngiltere", rate: "9.2", image: UIImage(named: "u2")!)
        let u3 =  University(name: "Yasar Üniversitesi", location: "İzmir, Türkiye", rate: "8.1", image: UIImage(named: "u3")!)
        self.universities.insert(u0, at: 0)
        self.universities.insert(u1, at: 1)
        self.universities.insert(u2, at: 2)
        self.universities.insert(u3, at: 3)
    }
    

    
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == universityCollectionView {
            return universities.count
        }else{
            return 12
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.universityCollectionView {
            
            let uniCell = universityCollectionView.dequeueReusableCell(withReuseIdentifier: "universityCell", for: indexPath) as! UniversityCollectionViewCell
            uniCell.mainImageView.image = self.universities[indexPath.row].image
            uniCell.nameLabel.text = self.universities[indexPath.row].name
            uniCell.locationLabel.text = self.universities[indexPath.row].location
            uniCell.rateLabel.text = self.universities[indexPath.row].rate
            return uniCell

        }else {
            let articleCell = blogCollectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticleCollectionViewCell
            articleCell.setData(title: "2020 En çok tercih edilen üniversiteleri hemen incele", image: UIImage(named: "u2")!)
            return articleCell
            
        }
    }
    
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
         return CGSize(width: width, height: width)
    }
    func calculateWidth() -> CGFloat{
        let estimatedWidth = CGFloat(self.estimatedWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
}
