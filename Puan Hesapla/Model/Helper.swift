//
//  ErrorHandlings.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 29.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation

struct TYTParse {
    var result : TYTResult
    var intResult = TYTIntResult()
    init(result : TYTResult) {
        self.result = result
    }
    /// Checks the data type of input field whether they are Integer or not && Parse :
    /// 0 - Success
    /// 1 - TR
    /// 2 - MAT
    /// 3 - SOS
    /// 4 - FEN
    /// 5 - DIPLOMA
    mutating func parseToInt() -> Int {
        
        if let trT =  Int(result.trT), let trF = Int(result.trF) {
            if let matT =  Int(result.matT), let matF = Int(result.matF) {
                if let sosT =  Int(result.sosT), let sosF = Int(result.sosF) {
                    if let fenT = Int(result.fenT), let fenF = Int(result.fenF) {
                        if let diploma = Int(result.diplomaGrade){
                            let r = checkRange(trT,trF,matT,matF,sosT,sosF,fenT,fenF,diploma)
                            if r == 11 {
                                self.intResult = TYTIntResult(trT: trT,matT: matT,fenT: fenT,sosT: sosT,trF: trF,matF: matF,fenF: fenF,sosF: sosF,diplomaGrade: diploma,check: result.check,trNet: 0.0, matNet: 0.0, sosNet: 0.0,fenNet: 0.0, hamGrade: 0.0, yerGrade: 0.0)
                                return 0
                            }
                            else { return r }
                        }else{
                            return 5
                        }
                    }else{
                        return 4
                    }
                }else{
                    return 3
                }
            }else{
                return 2
            }
        }else{
            return 1
        }
    }
    /// Checks the range of input field :
    /// 11 - Success
    /// 10 - TR
    /// 9 - MAT
    /// 8 - SOS
    /// 7 - FEN
    /// 6 - DIPLOMA
    func checkRange(_ trT : Int, _ trF : Int, _ matT : Int, _ matF : Int, _ sosT : Int, _ sosF : Int, _ fenT : Int, _ fenF : Int, _ diploma : Int) -> Int{
        if trT + trF > 40 { return 10 }
        else if  matT + matF > 40 { return 9 }
        else if sosT + sosF > 20 { return 8 }
        else if fenT + fenF > 20 { return 7 }
        else if diploma > 100 { return 6 }
        else { return 11 }
    }
}

struct AYTParse {
    var result : AYTResult
    var intResult = AYTIntResult()
    init(result : AYTResult) {
        self.result = result
    }
    /// Checks the data type of input field whether they are Integer or not :
    /// 0 - Success
    /// 1 - TD
    /// 2 - SOS
    /// 3 - MAT
    /// 4 - FEN
    /// 5 - YD
    /// 6 - DIPLOMA
    mutating func parseToInt() -> Int {
        
        if let tdT =  Int(result.tdT), let tdF = Int(result.tdF) {
            if let sosT =  Int(result.sosT), let sosF = Int(result.sosF) {
                if let matT =  Int(result.matT), let matF = Int(result.matF) {
                    if let fenT = Int(result.fenT), let fenF = Int(result.fenF) {
                        if let ydT = Int(result.ydT), let ydF = Int(result.ydF){
                            if let diploma = Int(result.diploma){
                                let r = checkRange(tdT,tdF,matT,matF,sosT,sosF,fenT,fenF,ydT,ydF,diploma)
                                if r == 13 {
                                    self.intResult = AYTIntResult(tdT: tdT, matT: matT, fenT: fenT, sosT: sosT, ydT: ydT, tdF: tdF, matF: matF, fenF: fenF, sosF: sosF, ydF: ydF,diploma: diploma, tdNet: 0.0, matNet: 0.0, fenNet: 0.0, sosNet: 0.0, ydNet: 0.0, eaHam: 0.0, sozHam: 0.0, sayHam: 0.0, ydilHam: 0.0, eaYer: 0.0, sozYer: 0.0, sayYer: 0.0, ydilYer: 0.0)
                                    return 0
                                }
                                else { return r }
                            }else { return 6 }
                        }else{ return 5 }
                    }else{ return 4 }
                }else{ return 3 }
            }else{ return 2 }
        }else{ return 1 }
    }
    /// Checks the range of input field :
    /// 13 - Correct range
    /// 12 - TR
    /// 11 - MAT
    /// 10 - SOS
    /// 9 - FEN
    /// 8 - YDIL
    /// 7 - DIPLOMA
    func checkRange(_ tdT : Int, _ tdF : Int, _ matT : Int, _ matF : Int, _ sosT : Int, _ sosF : Int, _ fenT : Int, _ fenF : Int, _ ydT : Int, _ ydF : Int , _ diploma : Int) -> Int{
        if tdT + tdF > 40 { return 12}
        else if  matT + matF > 40 { return 11 }
        else if sosT + sosF > 40 { return 10 }
        else if fenT + fenF > 40 { return 9 }
        else if ydT + ydF > 80 { return 8 }
        else if diploma > 100 { return 7 }
        else { return 13 }
    }
}
