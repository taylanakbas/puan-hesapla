//
//  BlogDetailViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 8.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class BlogDetailViewController: UIViewController {

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var constL: NSLayoutConstraint!
    @IBOutlet weak var constR: NSLayoutConstraint!
    @IBOutlet weak var constTop: NSLayoutConstraint!
    @IBOutlet weak var constBottom: NSLayoutConstraint!

    private var lastContentOffset: CGFloat = 0

    var str = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.delegate = self
        
        self.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        //headerImage.image = addBlurTo(self.headerImage.image!)
        content.attributedText = htmlToAttributedString(str)
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func htmlToAttributedString(_ str : String)-> NSAttributedString?{
        
        let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
            <style>
                body {
                  font-family: 'Montserrat';font-size: 22px;
                }
                img {width: 100% !important;max-width: \(self.content.frame.width - 48) !important;height: auto;max-height: \(self.content.frame.height / 3) !important;border-radius: 20px !important;margin-top: 8px !important;margin-bottom: 8px !important;}
            </style>
          </head>
          <body>
            \(str)
          </body>
        </html>
        """
        guard let attributed = try? NSAttributedString(data: htmlTemplate.data(using: .unicode)!,
                                                     options: [.documentType: NSAttributedString.DocumentType.html],
                                                     documentAttributes: nil) else { return nil }
        return attributed
    }
    
    func addBlurTo(_ image: UIImage) -> UIImage? {
        guard let ciImg = CIImage(image: image) else { return nil }
        let blur = CIFilter(name: "CIGaussianBlur")
        blur?.setValue(ciImg, forKey: kCIInputImageKey)
        blur?.setValue(4.0, forKey: kCIInputRadiusKey)
        if let outputImg = blur?.outputImage {
            return UIImage(ciImage: outputImg)
        }
        return nil
    }
}

extension BlogDetailViewController : UITextViewDelegate {


    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y == 0 {
            UIView.animate(withDuration: 2, animations: {
                self.constL.constant = 70
                self.constR.constant = 70
                self.constBottom.constant = 40
                self.view.layoutIfNeeded()
            })
        }
        
        let dif = self.lastContentOffset - scrollView.contentOffset.y
        print(dif)
        if dif  < 0 {
            // down
            UIView.animate(withDuration: 3, animations: {
                self.constL.constant -= (self.constL.constant < 40) ? 0 : 10
                self.constR.constant -= (self.constR.constant < 40) ? 0 : 10
                //self.constTop.constant -= (self.constTop.constant < 40) ? 0 : 10
                self.constBottom.constant -= (self.constBottom.constant < 40) ? 0 : 5
                self.view.layoutIfNeeded()
            })
        }
        

        self.lastContentOffset = scrollView.contentOffset.y
    }

    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 3, animations: {
            self.constL.constant = 70
            self.constR.constant = 70
            self.constBottom.constant = 40
            self.view.layoutIfNeeded()
        })
    }

}
