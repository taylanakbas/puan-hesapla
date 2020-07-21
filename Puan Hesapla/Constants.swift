//
//  Constants.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 30.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation

struct K {
    struct XIB {
        struct Table {
            static let title = "TitleTableViewCell"
            static let titleHeight = 240.0
            static let banner = "BannerTableViewCell"
            static let bannerHeight = 80.0
            static let university = "UniversityTableViewCell"
            static let universityHeight = 230.0
            static let article = "ArticleTableViewCell"
            static let articleHeight = 80
        }

    }
    
    struct SB {
        static let main = "Main"
        static let alert = "AlertStoryboard"
        static let web = "WebViewStoryboard"
    }
    struct VC {
        static let home = "HomeViewController"
        static let blog = "BlogViewController"
        static let calculator = "CalculatorViewController"
        static let web = "WebViewController"
    }
    struct URL {
        static let main = "https://univerlist.com/tr/"
        static let universities = "https://univerlist.com/tr/universiteler/"
        static let blog = "https://univerlist.com/tr/blog/"
        struct Scheme {
            static let university = "app://uni"
            static let blog  = "app://blog"
            static let seperator = "?"
        }
    }
    
    struct API {
        static let url = "https://furkanerkorkmaz.com/stajyer/"
        static let uni = "university"
        static let blog = "blog"
        static let ext = ".json"
        static let response = "results"
    }
    struct Resources {
        static let video = "univerlist"
        static let videoExt = "mp4"
    }
    
    struct Error {
                
        struct API {
            static let parse = "Json Parse Error : "
        }
        struct Resources {
            static let notFound = " not found!"
                
        }
        struct Calc {
            static let tyt : [Int : String] = [
                1 : "TYT-Türkçe",
                2 : "TYT-Matematik",
                3 : "TYT-Sosyal",
                4 : "TYT-Fen",
                5 : "Diploma",
                6 : "Diploma",
                7 : "TYT-Fen",
                8 : "TYT-Sosyal",
                9 : "TYT-Matematik",
                10 : "TYT-Türkçe",
            ]
            static let ayt : [Int : String] = [
                13 : "AYT-Edebiyat",
                14 : "AYT-Sosyal Bilgiler",
                15 : "AYT-Matematik",
                16 : "AYT-Fen Bilgisi",
                17 : "AYT-Yabancı Dil",
                18 : "Diploma",
                19 : "Diploma",
                20 : "AYT-Yabancı Dil",
                21 : "AYT-Fen Bilgisi",
                22 : "AYT-Matematik",
                23 : "AYT-Sosyal Bilgiler",
                24 : "AYT-Edebiyat"
            ]
            
        }
        
    }
    
}
