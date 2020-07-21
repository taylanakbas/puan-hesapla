//
//  DeepLinkManager.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 20.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation
import UIKit
class DeepLinkManager {

    var root = UIViewController()

    let homeVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.home) as! HomeViewController
    let blogVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.blog) as! BlogViewController
    let calcVC = UIStoryboard.init(name: K.SB.main, bundle: Bundle.main).instantiateViewController(withIdentifier: K.VC.calculator) as! CalculatorViewController
    let webVC =  UIStoryboard(name: K.SB.web, bundle: .main).instantiateViewController(withIdentifier: K.VC.web) as! WebViewController
    let tabBarController = UITabBarController()

    func execute(with : URL) -> (response: Bool, vc: UIViewController?, web : UIViewController) {

        tabBarController.viewControllers = [homeVC, blogVC, calcVC]
        let urlStr = with.absoluteString.components(separatedBy: K.URL.Scheme.seperator)
        if urlStr.first == K.URL.Scheme.university {
            pushToUniversity(urlStr.last!)
            return (true,root, webVC)
        }else if urlStr.first == K.URL.Scheme.university {
            pushToBlog(urlStr.last!)
            return (true,root, webVC)
        }
        return (false,root,webVC)
    }
    func pushToBlog(_ param : String){
        tabBarController.selectedIndex = 1
        webVC.url = K.URL.blog + param + "/"
        self.root = tabBarController
    }
    func pushToUniversity(_ param : String){
        tabBarController.selectedIndex = 0
        webVC.url =  K.URL.main + param + "/"
        self.root = tabBarController
    }
}
