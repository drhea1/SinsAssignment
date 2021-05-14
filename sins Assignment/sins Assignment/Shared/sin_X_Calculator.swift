//
//  sin_X_Calculator.swift
//  sins Assignment
//
//  Created by Derek Rhea on 2/11/21.
//

import Foundation
import SwiftUI

class sin_X_Calculator: NSObject, ObservableObject {
    
    @Published var stateNumberOfIterations: Int = 1
    @Published var stateXValue: Double = 1.0
    var plotDataModel: PlotDataClass? = nil
    var plotError: Bool = false
    
    func updateVariables(N: Int, X: Double) {
        stateNumberOfIterations = N
        stateXValue = X
    }
    
    
//                             n - 1  2n - 1
//             __ N      ( - 1)      x
//  sin(x) ~  \         ---------------------
//            /__ n = 1       (2n - 1)!
//
    
    
    func calculateSinX() -> Double {
        
        var sinArray: [Double] = []
        
        for n in 1...stateNumberOfIterations {
            
            let factorialTotal = factorialCount(n: n)
            
            sinArray.append( (pow(-1.0,Double(n-1))*pow(stateXValue,Double(2*n-1))) / (factorialTotal) )
        }
        
        return sinArray.reduce(0,+)
    }
    
    
// Finds (2n-1)!
    func factorialCount(n: Int) -> Double {
        
        let factorialHighest = 2*n - 1
        var factorialTotal = 1.0
        for factorialCount in 1...factorialHighest {
            factorialTotal *= Double(factorialCount)
        }
        
        return factorialTotal
    }
    

    

//           N   2N  +  1                                   n - 1   2n - 1
//   | ( - 1)  x         |          - 7|  __ N       ( - 1)       x         |
//   ---------------------  <=   10    | \          ----------------------  |
//         (2N - 1)!                   | /__ n = 1         (2n - 1)!        |


    func sinXErrorCheckAfterN() {
        var n = 1
        var nextTerm = abs( pow(-1.0,Double(n))*pow(stateXValue,Double(2*n+1)) ) / factorialCount(n: n)
        
        if nextTerm <= pow(10.0,Double(-7.0)) * calculateSinX() {
        
            repeat {
                n += 1
                stateNumberOfIterations = n
                nextTerm = abs( pow(-1.0,Double(n))*pow(stateXValue,Double(2*n+1)) ) / factorialCount(n: n)
                
            } while nextTerm <= pow(10.0,Double(-7.0)) * calculateSinX()
        }
        print("n = " + String(n))
        print(String(nextTerm) + " <= " + String(pow(10.0,Double(-7.0)) * calculateSinX()))
    
    
    }
    
    
    
    
    
    
    
}


    
