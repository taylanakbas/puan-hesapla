//
//  Blog.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 15.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation

struct Blog {
    var title : String
    var imageUrl : String
    var content : String
    var slug : String
    
    internal init(_ json:[[String:Any]], _ idx : Int) {
        self.title = json[idx]["name"] as! String
        self.imageUrl = json[idx]["thumbnail"] as! String
        self.slug = json[idx]["slug"] as! String
        self.content = ""
    }
    init(title : String, image: String, content: String) {
        self.title = title
        self.imageUrl = image
        self.slug = ""
        self.content = content
    }
    init() {
        self.title = ""
        self.imageUrl = ""
        self.slug = ""
        self.content = ""
    }
    
    
}
