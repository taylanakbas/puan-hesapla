//
//  OnboardingViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 21.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var scrollWidth : CGFloat! = 0.0
    var scrollHeight : CGFloat! = 0.0
    
    var titles = [
        "Puan Hesapla",
        "Hayalindeki üniversiteyi bul",
        "Bölümler hakkında doğru bilgiyi al"
    ]
    var descriptions = [
        "Sistem değişti, kafalar karıştı! TYT-AYT Puan Hesaplama ile olası puanını hesaplayabilirsin",
        "Geleceğin için hayallerini kurduğun üniversiteyi bul",
        "Hayallerindeki meslek için bölümle ilgili yazılarımızı okumalısın"
    ]
    var images = [K.Resources.Image.onboard1,K.Resources.Image.onboard2,K.Resources.Image.onboard3]
    
    override func viewDidLayoutSubviews() {
        // Get dynamic width and height
        scrollWidth = view.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidLayoutSubviews()
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        for idx in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(idx)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            let slide = UIView(frame: frame)
            
            let title = UILabel.init(frame: CGRect(x: 16, y: 48, width: scrollWidth - 64, height: 180))
            title.textAlignment = .left
            title.numberOfLines = 0
            print(title.numberOfLines)
            title.textColor = .black
            title.text = self.titles[idx]
            title.font = UIFont(name: K.Resources.Font.bold, size: 40)
            
            let desc = UILabel.init(frame: CGRect(x: 16, y: title.frame.maxY - 16, width: scrollWidth, height: 100))
            desc.textAlignment = .left
            desc.numberOfLines = 0
            desc.textColor = .gray
            desc.text = self.descriptions[idx]
            desc.font = UIFont(name: K.Resources.Font.regular, size: 18)
            
            let imageView = UIImageView.init(image: UIImage.init(named: images[idx]))
            imageView.frame = CGRect(x:0,y:0,width:200,height:200)
            imageView.contentMode = .scaleAspectFill
            imageView.center = CGPoint(x:scrollWidth/2 + 60,y: scrollHeight/2 - 16)
            imageView.alpha = 0.6
            
            slide.addSubview(imageView)
            slide.addSubview(title)
            slide.addSubview(desc)
            scrollView.addSubview(slide)
        }
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        self.scrollView.contentSize.height = 1.0
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
        
    }
    @IBAction func pageChanged(_ sender: Any) {
        self.scrollView!.scrollRectToVisible(
            CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!),
                   y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    func changeCurrentPage() {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}

extension OnboardingViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.changeCurrentPage()
    }
}
