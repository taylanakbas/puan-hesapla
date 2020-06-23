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
            let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as? UniversityTableViewCell
            return cell!

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? UniversityTableViewCell
            return cell!
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
