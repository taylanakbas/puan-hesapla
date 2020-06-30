//
//  TYTResult.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation

struct TYTResult {
    
    var trT : String = "0"
    var matT : String = "0"
    var fenT : String = "0"
    var sosT : String = "0"
    var trF : String = "0"
    var matF : String = "0"
    var fenF : String = "0"
    var sosF : String = "0"
    var diplomaGrade : String = "0"
    var check : Bool = false
    
    init(_ trT: String, _ matT: String, _ fenT: String, _ sosT: String, _ trF: String, _ matF: String, _ fenF: String, _ sosF: String, _ diplomaGrade: String, _ check: Bool) {
        self.trT = trT
        self.matT = matT
        self.fenT = fenT
        self.sosT = sosT
        self.trF = trF
        self.matF = matF
        self.fenF = fenF
        self.sosF = sosF
        self.diplomaGrade = diplomaGrade
        self.check = check
    }
    init(){
        self.trT = "0"
        self.matT = "0"
        self.fenT = "0"
        self.sosT = "0"
        self.trF = "0"
        self.matF = "0"
        self.fenF = "0"
        self.sosF = "0"
        self.diplomaGrade =  "0"
        self.check =  false
    }
}
struct TYTIntResult {
    var trT : Int = 0
    var matT : Int = 0
    var fenT : Int = 0
    var sosT : Int = 0
    var trF : Int = 0
    var matF : Int = 0
    var fenF : Int = 0
    var sosF : Int = 0
    var diplomaGrade : Int = 0
    var check : Bool = false
    var trNet : Double = 0.0
    var matNet : Double = 0.0
    var sosNet : Double = 0.0
    var fenNet : Double = 0.0
    var hamGrade : Double = 0.0
    var yerGrade : Double = 0.0

    internal init(trT: Int, matT: Int, fenT: Int, sosT: Int, trF: Int, matF: Int, fenF: Int, sosF: Int, diplomaGrade: Int, check: Bool, trNet: Double, matNet: Double, sosNet: Double, fenNet: Double, hamGrade: Double, yerGrade: Double) {
        self.trT = trT
        self.matT = matT
        self.fenT = fenT
        self.sosT = sosT
        self.trF = trF
        self.matF = matF
        self.fenF = fenF
        self.sosF = sosF
        self.diplomaGrade = diplomaGrade
        self.check = check
        self.trNet = trNet
        self.matNet = matNet
        self.sosNet = sosNet
        self.fenNet = fenNet
        self.hamGrade = hamGrade
        self.yerGrade = yerGrade
    }
    init(){
        self.trT = 0
        self.matT = 0
        self.fenT = 0
        self.sosT = 0
        self.trF = 0
        self.matF = 0
        self.fenF = 0
        self.sosF = 0
        self.diplomaGrade = 0
        self.check = false
        self.trNet = 0.0
        self.matNet = 0.0
        self.sosNet = 0.0
        self.fenNet = 0.0
        self.hamGrade = 0.0
        self.yerGrade = 0.0
        
    }
    
}
struct AYTResult {
    var tdT : String = "0"
    var matT : String = "0"
    var fenT : String = "0"
    var sosT : String = "0"
    var ydT : String = "0"
    var tdF : String = "0"
    var matF : String = "0"
    var fenF : String = "0"
    var sosF : String = "0"
    var ydF : String = "0"
    var diploma : String = "0"

    internal init(_ tdT: String, _ matT: String, _ fenT: String, _ sosT: String, _ ydT: String, _ tdF: String, _ matF: String, _ fenF: String, _ sosF: String, _ ydF: String, _ diploma: String) {
        self.tdT = tdT
        self.matT = matT
        self.fenT = fenT
        self.sosT = sosT
        self.ydT = ydT
        self.tdF = tdF
        self.matF = matF
        self.fenF = fenF
        self.sosF = sosF
        self.ydF = ydF
        self.diploma = diploma
    }
    init() {
        self.tdT = "0"
        self.matT = "0"
        self.fenT = "0"
        self.sosT = "0"
        self.ydT = "0"
        self.tdF = "0"
        self.matF = "0"
        self.fenF = "0"
        self.sosF = "0"
        self.ydF = "0"
        self.diploma = "0"
    }
}

struct AYTIntResult {
    var tdT : Int
    var matT : Int
    var fenT : Int
    var sosT : Int
    var ydT : Int
    var tdF : Int
    var matF : Int
    var fenF : Int
    var sosF : Int
    var ydF : Int
    var diploma : Int
    var tdNet : Double
    var matNet : Double
    var fenNet : Double
    var sosNet : Double
    var ydNet : Double
    var eaHam : Double
    var sozHam : Double
    var sayHam : Double
    var ydilHam : Double
    var eaYer : Double
    var sozYer : Double
    var sayYer : Double
    var ydilYer : Double
    internal init(tdT: Int, matT: Int, fenT: Int, sosT: Int, ydT: Int, tdF: Int, matF: Int, fenF: Int, sosF: Int, ydF: Int, diploma : Int, tdNet: Double, matNet: Double, fenNet: Double, sosNet: Double, ydNet: Double, eaHam: Double, sozHam: Double, sayHam: Double, ydilHam: Double, eaYer: Double, sozYer: Double, sayYer: Double, ydilYer: Double) {
        self.tdT = tdT
        self.matT = matT
        self.fenT = fenT
        self.sosT = sosT
        self.ydT = ydT
        self.tdF = tdF
        self.matF = matF
        self.fenF = fenF
        self.sosF = sosF
        self.ydF = ydF
        self.diploma = diploma
        self.tdNet = tdNet
        self.matNet = matNet
        self.fenNet = fenNet
        self.sosNet = sosNet
        self.ydNet = ydNet
        self.eaHam = eaHam
        self.sozHam = sozHam
        self.sayHam = sayHam
        self.ydilHam = ydilHam
        self.eaYer = eaYer
        self.sozYer = sozYer
        self.sayYer = sayYer
        self.ydilYer = ydilYer
    }
    init() {
        self.tdT = 0
        self.matT = 0
        self.fenT = 0
        self.sosT = 0
        self.ydT = 0
        self.tdF = 0
        self.matF = 0
        self.fenF = 0
        self.sosF = 0
        self.ydF = 0
        self.diploma = 0
        self.tdNet = 0.0
        self.matNet = 0.0
        self.fenNet = 0.0
        self.sosNet = 0.0
        self.ydNet = 0.0
        self.eaHam = 0.0
        self.sozHam = 0.0
        self.sayHam = 0.0
        self.ydilHam = 0.0
        self.eaYer = 0.0
        self.sozYer = 0.0
        self.sayYer = 0.0
        self.ydilYer = 0.0
        
    }
}
