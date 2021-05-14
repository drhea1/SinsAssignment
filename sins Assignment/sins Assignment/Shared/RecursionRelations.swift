//
//  RecursionRelations.swift
//  sins Assignment
//
//  Created by Derek Rhea on 2/10/21.
//

import Foundation
import SwiftUI

class RecursionRelations: NSObject, ObservableObject {
    
    @Published var lValue: Int = 1
    @Published var xValues = [1.0]
    
    func updateLandX(lVal: Int, xVal: Double...) {
        
        lValue = lVal
        xValues = xVal
    }
    
    
//              sin(x)
//   j (x)  =   ------
//    o           x


    func recursionZero(x: Double) -> Double {
        return sin(x) / x
    }
    
    
    
    
    
//             sin(x)      cos(x)
//  j (x)  =   ------  -   ------
//   1            2           x
//               x

    func recursionOne(x: Double) -> Double {
        return (sin(x) / Double(pow(x,2))) - (cos(x) / x)
    }
    
    
    
    
    
//                 2l + 1
//  j     (x)  =   ------ j (x)   -    j     (x)
//   l + 1            x    l            l - 1
    
    
    func recursionUp() -> [Double?] {
        var recursionUpArray: [Double?] = Array(repeating: nil, count: xValues.count)
        for x in xValues {
            var recursionInX: [Double] = [Double]()
            recursionInX.append(recursionZero(x: x))
            recursionInX.append(recursionOne(x: x))
            for l in 1...lValue {
                let lMinus1 = l - 1
                let recurUpValAtL = (((2.0*Double(l)) + 1) / x)*recursionInX[l] - recursionInX[lMinus1]
                recursionInX.append(recurUpValAtL)
            }
            recursionUpArray.append(contentsOf: recursionInX)
        }
        return recursionUpArray
    }
    
    
    
    
    
//                 2l + 1
//  j     (x)  =   ------ j (x)   -    j     (x)
//   l - 1            x    l            l + 1
    
    
    func recursionDown(start: Int) -> [Double] {
        var recursionDownArray: [Double] = Array(repeating: 0.0, count: xValues.count)
        
        for x in xValues {
            var recursionInX: [Double] = Array(repeating: 0.0, count: start)
            
            recursionInX[start - 1] = 1.0
            recursionInX[start - 2] = 1.0
            
            for index in (1...(start-3)).reversed() {
                let numerator = 2.0*Double(index) + 1
                recursionInX[index - 1] = (numerator / x)*recursionInX[index] - recursionInX[index + 1]
            }
            recursionDownArray.append(contentsOf: recursionInX)
        }
        return recursionDownArray
    }
    
    
    
    
}
