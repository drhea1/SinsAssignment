//
//  QuadraticFormula.swift
//  sins Assignment
//
//  Created by Derek Rhea on 2/5/21.
//

import Foundation
import SwiftUI

class QuadraticFormula: NSObject, ObservableObject {
    
    @Published var a = 1.0
    @Published var b = 1.0
    @Published var c = 1.0
    @Published var normQuadPlusSoln = 1.0
    @Published var normQuadMinusSoln = 1.0
    @Published var weirdQuadPlusSoln = 1.0
    @Published var weirdQuadMinusSoln = 1.0
    
    func normalQuadraticPlus() -> Double{
        
        normQuadPlusSoln = (-b + sqrt((pow(b,2.0) - 4.0*a*c))) / (2.0*a)
        print(String(normQuadPlusSoln))
        return normQuadPlusSoln
        
    }
    
    func normalQuadraticMinus() -> Double{
        
        normQuadMinusSoln = (-b - sqrt((pow(b,2.0) - 4.0*a*c))) / (2.0*a)
        return normQuadMinusSoln
    }
    
    func weirdQuadraticPlus() -> Double{
        
        weirdQuadPlusSoln = (-2.0*c) / (b + sqrt((pow(b,2.0) - 4.0*a*c)) )
        return weirdQuadPlusSoln
    }
    
    func weirdQuadraticMinus() -> Double{
        
        weirdQuadMinusSoln = (-2.0*c) / (b - sqrt((pow(b,2.0) - 4.0*a*c)) )
        return weirdQuadMinusSoln
    }
    
    func modifyVariables(aNew: Double, bNew: Double, cNew: Double) {
        a = aNew
        b = bNew
        c = cNew
        
    }
}

