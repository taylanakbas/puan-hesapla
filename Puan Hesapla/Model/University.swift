//
//  UniversityCollectionViewCell.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 19.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//
import Foundation
import UIKit

struct University {
    var name : String
    var location : String
    var rate : Double
    var imageUrl : String
    var slug : String
    
    init(_ json:[[String:Any]], _ idx : Int) {

        let province = json[idx]["province"] as! [String:Any]
        self.name = json[idx]["name"] as! String
        self.location =  province["name"] as! String
        self.rate =  json[idx]["ul_score"] as? Double ?? 0.0
        self.imageUrl = json[idx]["thumbnail"] as! String
        self.slug =  json[idx]["slug"] as! String
    }
    
}
