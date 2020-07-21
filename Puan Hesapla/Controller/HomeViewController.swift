//
//  HomeViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 22.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import AVKit
import WebKit
import SDWebImageWebPCoder

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cvUni : UICollectionView?
    var cvBlog : UICollectionView?
    
    var universities : [University] = []
    var articles : [Blog] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initUniversities()
        initArticles()
    }

    func initUniversities(){
        let session = URLSession.shared
        let url = URL(string: K.API.url + K.API.uni + K.API.ext)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any] else { return }
                let result = json[K.API.response] as! [[String:Any]]
                for idx in 0...result.count - 1 {
                    let uni = University(result, idx)
                    self.universities.insert(uni, at: idx)
                }
            }
            catch let error{
                print(K.Error.API.parse + error.localizedDescription)
            }
        })
        task.resume()
    }
    func initArticles(){
        let session = URLSession.shared
         let url = URL(string: K.API.url + K.API.blog + K.API.ext)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any] else { return }
                let result = json[K.API.response] as! [[String:Any]]
                for idx in 0...7 {
                    let article = Blog(result, idx)
                    self.articles.insert(article, at: idx)
                }
            } catch let error{
                print(K.Error.API.parse + error.localizedDescription)
            }
        })
        task.resume()
    }
    @objc func playVideo(){
        guard let path = Bundle.main.path(forResource: K.Resources.video, ofType:K.Resources.videoExt) else {
            debugPrint("Video is \(K.Error.Resources.notFound)")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func allUniversities(){
        let storyboard = UIStoryboard(name: K.SB.web, bundle: .main)
        let webVC = storyboard.instantiateViewController(withIdentifier: K.VC.web) as! WebViewController
        webVC.url = K.URL.universities
        self.present(webVC, animated: true)
        
    }
    @objc func allArticles(){
        let storyboard = UIStoryboard(name: K.SB.web, bundle: .main)
        let webVC = storyboard.instantiateViewController(withIdentifier: K.VC.web) as! WebViewController
        webVC.url = K.URL.blog
        self.present(webVC, animated: true)
    }
    @objc func detailedUniversity(_ sender : UITapGestureRecognizer){
        let location = sender.location(in: self.cvUni)
        let indexPath = self.cvUni?.indexPathForItem(at: location)

        if let index = indexPath {
            let storyboard = UIStoryboard(name: K.SB.web, bundle: .main)
            let webVC = storyboard.instantiateViewController(identifier: K.VC.web) as! WebViewController
            webVC.url = K.URL.main + self.universities[index.row].slug
            self.present(webVC, animated: true)
        }
    }
    @objc func detailedArticle(_ sender : UITapGestureRecognizer){
        let location = sender.location(in: self.cvBlog)
        let indexPath = self.cvBlog?.indexPathForItem(at: location)

        if let index = indexPath {
            let storyboard = UIStoryboard(name: K.SB.web, bundle: .main)
            let webVC = storyboard.instantiateViewController(identifier: K.VC.web) as! WebViewController
            webVC.url = K.URL.blog + self.articles[index.row].slug
            self.present(webVC, animated: true)
        }
    }
    @objc func segueToCalculator(){
        
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("BannerTableViewCell", owner: self, options: nil)?.first as! BannerTableViewCell
            cell.playButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
            cell.calculateButton.addTarget(self, action: #selector(segueToCalculator), for: .touchUpInside)
            return cell
        }else if indexPath.section == 1 {
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.titleLabel.text = "Popüler Üniversiteler"
            cell.seeAllButton.addTarget(self, action: #selector(allUniversities), for: .touchUpInside)
            return cell
        }else if indexPath.section == 2 {
            let cell = Bundle.main.loadNibNamed("UniversityTableViewCell", owner: self, options: nil)?.first as! UniversityTableViewCell
            self.cvUni = cell.collectionView
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: "UniversityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UniversityCollectionViewCell")
            return cell
        }else if indexPath.section == 3 {
            let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as! TitleTableViewCell
            cell.titleLabel.text = "Yazılar"
            cell.seeAllButton.addTarget(self, action: #selector(allArticles), for: .touchUpInside)
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
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 240.0
        case 1:
            return 80.0
        case 2:
            return 230.0
        case 3:
            return 80.0
        case 4:
            return 830.0
        default:
            return 0.0
        }
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cvUni {
            return universities.count
        }
        else {
            return articles.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.cvUni {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UniversityCollectionViewCell", for: indexPath) as? UniversityCollectionViewCell else {
                fatalError("Cell not exists in storyboard")
            }
            
            cell.nameLabel.text = self.universities[indexPath.row].name
            cell.locationLabel.text = self.universities[indexPath.row].location
            if self.universities[indexPath.row].rate == 0.0 {
                cell.rateLabel.isHidden = true
            }else {
                cell.rateLabel.text = String(self.universities[indexPath.row].rate)
            }
            let webPCoder = SDImageWebPCoder.shared
            SDImageCodersManager.shared.addCoder(webPCoder)
            let webpURL = URL(string:self.universities[indexPath.row].imageUrl)!
            DispatchQueue.main.async {
                cell.mainImageView.sd_setImage(with: webpURL)
            }
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(detailedUniversity(_:))))
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as? ArticleCollectionViewCell else {
                fatalError("Cell not exists in storyboard")
            }
            let webPCoder = SDImageWebPCoder.shared
            SDImageCodersManager.shared.addCoder(webPCoder)
            let webpURL = URL(string:self.articles[indexPath.row].imageUrl)!
            DispatchQueue.main.async {
                cell.mainImageView.sd_setImage(with: webpURL)
            }
            cell.titleLabel.text = self.articles[indexPath.row].title
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(detailedArticle(_:))))
            return cell
        }
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.cvUni{
            let width = calculateWidth()
            return CGSize(width: width, height: 230.0)
        }else{
            let width = calculateWidth()
            return CGSize(width: width, height: 200.0)
        }
    }
    func calculateWidth() -> CGFloat{
        //let estimatedWidth = 160.0
        let cellMarginSize = 16.0
        let estimatedWidth = CGFloat(160.0)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
}


