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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as! UniversityTableViewCell
            
            cell.cv.dataSource = self
            cell.cv.delegate = self
            cell.cv.register(UINib(nibName: "ReciptCVCell", bundle: nil), forCellWithReuseIdentifier: "ReciptCVCell")
            self.cvUni = cell.cv
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! UniversityTableViewCell
            
            cell.cv.dataSource = self
            cell.cv.delegate = self
            cell.cv.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
            self.cvBlog = cell.cv
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240.0
        }else{
            return 245.0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvUni {
            return 2
        }
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvUni {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UniversityCollectionViewCell", for: indexPath) as!  UniversityCollectionViewCell
            collectionView.delegate = self
            collectionView.dataSource = self
            
            
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
            collectionView.delegate = self
            collectionView.dataSource = self
            
            
            return cell
            
        }
    }
}
