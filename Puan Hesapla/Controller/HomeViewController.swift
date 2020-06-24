//
//  HomeViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cvUni : UICollectionView?
    var cvBlog : UICollectionView?
    
    var universities : [University] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initUniversities()
    }

    func initUniversities(){
        let u0 =  University(name: "Manchester Üniversitesi", location: "Manchester, İngiltere", rate: "9.4", image: UIImage(named: "u0")!)
        let u1 =  University(name: "Bahcesehir Üniversitesi", location: "İstanbul, Türkiye", rate: "8.8", image: UIImage(named: "u1")!)
        let u2 =  University(name: "Liverpool Üniversitesi", location: "Liverpool, İngiltere", rate: "9.2", image: UIImage(named: "u2")!)
        let u3 =  University(name: "Adnan Menderes Üniversitesi", location: "İzmir, Türkiye", rate: "8.1", image: UIImage(named: "u3")!)
        self.universities.insert(u0, at: 0)
        self.universities.insert(u1, at: 1)
        self.universities.insert(u2, at: 2)
        self.universities.insert(u3, at: 3)
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = Bundle.main.loadNibNamed("UniversityTableViewCell", owner: self, options: nil)?.first as! UniversityTableViewCell
            self.cvUni = cell.collectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: "UniversityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UniversityCollectionViewCell")
            //cell.seeAllButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! ArticleTableViewCell
            self.cvBlog = cell.collectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 260 }
        else { return 900 }
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cvUni {
            return universities.count
        }
        else {
            return 8
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.cvUni {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UniversityCollectionViewCell", for: indexPath) as? UniversityCollectionViewCell else {
                fatalError("Cell not exists in storyboard")
            }
            cell.mainImageView.image = self.universities[indexPath.row].image
            cell.nameLabel.text = self.universities[indexPath.row].name
            cell.locationLabel.text = self.universities[indexPath.row].location
            cell.rateLabel.text = self.universities[indexPath.row].rate
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as? ArticleCollectionViewCell else {
                fatalError("Cell not exists in storyboard")
            }
            cell.mainImageView.image = UIImage(named: "u3")
            cell.titleLabel.text = "2020 En çok tercih edilen üniversiteleri hemen incele"
            return cell
        }
        
    }
    
}
