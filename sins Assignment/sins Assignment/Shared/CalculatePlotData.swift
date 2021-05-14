//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//  Modified by Derek Rhea on 02/10/21. 
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    var finiteSum = FiniteSumCalculator()
    
    
    
    func plotLogErrorSumUpSumDown() {
        plotDataModel!.changingPlotParameters.yMax = 1
        plotDataModel!.changingPlotParameters.yMin = -1.5
        plotDataModel!.changingPlotParameters.xMax = 7.0
        plotDataModel!.changingPlotParameters.xMin = -1.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .green()
        plotDataModel!.changingPlotParameters.title = " log[ (Up-Down) / |Up+Down| ] = log[N] "
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] = []
        
        for n in 0 ..< 7 {

            let decimalIncrement = NSDecimalNumber(decimal: pow(10,n))
            let integerIncrement = Int(truncating: decimalIncrement)
            
            finiteSum.setNumberOfN( incr: integerIncrement )
            
            let x = log(Double(finiteSum.totalIncrements)) / log(Double(10))
            print(x)
            
            finiteSum.sumUp()
            finiteSum.sumDown()
            
            let y = log((finiteSum.sumUpResult - finiteSum.sumDownResult) / abs(finiteSum.sumUpResult + finiteSum.sumDownResult))
            print(y)
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
    }
    
    
    
    func plotLogErrorSum3Sum1() {
        
        plotDataModel!.changingPlotParameters.yMax = -25.0
        plotDataModel!.changingPlotParameters.yMin = -40.0
        plotDataModel!.changingPlotParameters.xMax = 8.0
        plotDataModel!.changingPlotParameters.xMin = -1.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .green()
        plotDataModel!.changingPlotParameters.title = " log[ |(S1-S3)/S3| ] = log[N] "
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] = []
        
        for n in 0 ..< 7 {

            let decimalIncrement = NSDecimalNumber(decimal: pow(10,n))
            let integerIncrement = Int(truncating: decimalIncrement)
            
            finiteSum.setNumberOfN( incr: integerIncrement )
            
            let x = log(Double(finiteSum.totalIncrements)) / log(Double(10))
            print(x)
            
            finiteSum.sumFunction1()
            finiteSum.sumFunction3()
            
            let y = log(abs( (finiteSum.sumResult1 - finiteSum.sumResult3) / finiteSum.sumResult3))
            print(y)
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
    }

    func plotYEqualsX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

            let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

            let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
}



