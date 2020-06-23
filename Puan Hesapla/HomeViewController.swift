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
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("OnlyCollectionCell", owner: self, options: nil)?.first as! OnlyCollectionCell
            
            self.cvUni = cell.collectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: "ToolsCVCell", bundle: nil), forCellWithReuseIdentifier: "ToolsCVCell")
            
            
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed("OnlyCollectionCell", owner: self, options: nil)?.first as! OnlyCollectionCell
            
            self.cvBlog = cell.collectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: "ToolsCVCell", bundle: nil), forCellWithReuseIdentifier: "ToolsCVCell")
            
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
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.cvUni {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToolsCVCell", for: indexPath) as? ToolsCVCell else {
                fatalError("Cell not exists in storyboard")
            }
        
            cell.lblTitle.text = "text"
            
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToolsCVCell", for: indexPath) as? ToolsCVCell else {
                fatalError("Cell not exists in storyboard")
            }
            
            cell.lblTitle.text = "text"
            
            return cell
        }
        
    }
    
}
