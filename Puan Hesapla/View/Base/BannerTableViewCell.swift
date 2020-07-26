//
//  BannerTableViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 13.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var playVisualView: UIVisualEffectView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var iphoneImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playVisualView.alpha = 0
        logoImage.alpha = 0
        iphoneImage.alpha = 0
        bannerLabel.alpha = 0
        calculateButton.alpha = 0
        UIView.animate(withDuration: 0.75, animations: {
            self.playVisualView.alpha = 1
            self.logoImage.alpha = 1
            self.iphoneImage.alpha = 1
            self.bannerLabel.alpha = 1
            self.calculateButton.alpha = 1
        })
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 25, height: 25)).cgPath
        self.layer.mask = rectShape
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
