//
//  BlogViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 8.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit
import SDWebImageWebPCoder

class BlogViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var articles : [Blog] = []
    let starred = Blog(title: "Veterinerlik Bölümü Hakkında Bilmeniz Gerekenler", image: K.Resources.Image.firstBlog, content: K.Resources.html)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.XIB.Table.blog)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: K.Resources.Font.bold, size: 20)!]
        initArticles()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.items?[1].title = ""
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.items?[1].title = "Blog"
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
    @objc func detailedArticle(_ sender : UITapGestureRecognizer){
        let location = sender.location(in: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: location)

        if let index = indexPath {
            let storyboard = UIStoryboard(name: K.SB.web, bundle: .main)
            let webVC = storyboard.instantiateViewController(identifier: K.VC.web) as! WebViewController
            webVC.url = K.URL.blog + self.articles[index.row].slug
            webVC.modalPresentationStyle = .fullScreen
            self.present(webVC, animated: true)
        }
    }
    @objc func readStarred(){ performSegue(withIdentifier: K.detailBlogSegue, sender: K.Resources.html) }
}

extension BlogViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return articles.count
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.firstBlog, owner: self, options: nil)?.first as! FirstTableViewCell
            cell.articleTitle.text = starred.title
            cell.articleImageView.image = UIImage(named: starred.imageUrl)
            cell.readButton.addTarget(self, action: #selector(readStarred), for: .touchUpInside)
            return cell
            
        }else {
            let cell = Bundle.main.loadNibNamed(K.XIB.Table.blog, owner: self, options: nil)?.first as! BlogTableViewCell
              let webPCoder = SDImageWebPCoder.shared
            SDImageCodersManager.shared.addCoder(webPCoder)
            let webpURL = URL(string:self.articles[indexPath.row].imageUrl)!
            DispatchQueue.main.async {
                cell.articleImageView.sd_setImage(with: webpURL)
            }
            cell.articleTitle.text = self.articles[indexPath.row].title
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(detailedArticle(_:))))
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return K.XIB.Table.firstBlogHeight
        case 1:
            return K.XIB.Table.blogHeight
        default:
            return 0.0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.detailBlogSegue, sender: K.Resources.html)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! BlogDetailViewController
        detailVC.article = starred
    }
}
