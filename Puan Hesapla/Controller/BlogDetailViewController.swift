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
    var str = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.delegate = self
        
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        headerImage.image = addBlurTo(self.headerImage.image!)
        content.attributedText = htmlToAttributedString(str)
        
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
        blur?.setValue(2.0, forKey: kCIInputRadiusKey)
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

    }
}
