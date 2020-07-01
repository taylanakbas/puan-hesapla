//
//  Calculator.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation

struct Calculator {

    var tyt : TYTIntResult
    var ayt : AYTIntResult
    var dp : Double = 0.0
    
    internal init(_ tyt: TYTIntResult, _ ayt: AYTIntResult) {
        self.tyt = tyt
        self.ayt = ayt
        self.dp = diplomaGrade()
        self.calculate()
    }
    
    mutating func calculate(){
        TYTNet()
        AYTNet()
        TYTGrade()
        AYTGrade()
    }
    
    mutating func TYTNet(){
        self.tyt.trNet = Double(tyt.trT) - (Double(tyt.trF) * 0.25)
        self.tyt.matNet = Double(tyt.matT) - (Double(tyt.matF) * 0.25)
        self.tyt.fenNet = Double(tyt.fenT) - (Double(tyt.fenF) * 0.25)
        self.tyt.sosNet = Double(tyt.sosT) - (Double(tyt.sosF) * 0.25)
    }
    mutating func AYTNet(){
        self.ayt.tdNet = Double(ayt.tdT) - (Double(ayt.tdF) * 0.25)
        self.ayt.matNet = Double(ayt.matT) - (Double(ayt.matF) * 0.25)
        self.ayt.fenNet = Double(ayt.fenT) - (Double(ayt.fenF) * 0.25)
        self.ayt.sosNet = Double(ayt.sosT) - (Double(ayt.sosF) * 0.25)
        self.ayt.ydNet = Double(ayt.ydT) - (Double(ayt.ydF) * 0.25)
    }
    mutating func diplomaGrade()->Double{
        if tyt.check {
            return Double(((tyt.diplomaGrade * 6) / 10) / 2)
        }else{
            return Double(((tyt.diplomaGrade * 6) / 10))
        }
    }
    mutating func TYTGrade(){
        self.tyt.hamGrade = (tyt.trNet * 3.3) + (tyt.matNet * 3.3) + (tyt.sosNet * 3.4) + (tyt.fenNet * 3.4) + 100
        self.tyt.yerGrade = tyt.hamGrade + self.dp
    }
    mutating func AYTGrade(){
        let tytHam : Double = ((tyt.hamGrade - 100) * 40) / 100
        self.ayt.eaHam = tytHam + ((((ayt.tdNet * 5) + (ayt.matNet * 5)) * 60) / 100) + 100
        self.ayt.sozHam = tytHam + ((((ayt.tdNet * 5) + (ayt.sosNet * 5)) * 60) / 100) + 100
        self.ayt.sayHam = tytHam + ((((ayt.fenNet * 5) + (ayt.matNet * 5)) * 60) / 100) + 100
        self.ayt.ydilHam = tytHam + (((ayt.ydNet * 5) * 60) / 100) + 100
        self.ayt.eaYer = ayt.eaHam + self.dp
        self.ayt.sozYer = ayt.sozHam + self.dp
        self.ayt.sayYer = ayt.sayHam + self.dp
        self.ayt.ydilYer = ayt.ydilHam + self.dp
    }
}
