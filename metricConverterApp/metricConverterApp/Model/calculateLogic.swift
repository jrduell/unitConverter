//
//  calculateLogic.swift
//  metricConverterApp
//
//  Created by jacob on 6/9/19.
//  Copyright © 2019 jacob. All rights reserved.
//

import Foundation

class calculateLogic {
    class func getConverted(currentUnit: Int, desiredUnit: Int, amount: Double) -> Double {
    var valDifference: Int = 0
    var conversionFactor = 1
        
    valDifference = currentUnit - desiredUnit
    if valDifference < 0 {
        valDifference *= -1
        while valDifference > 0 {
            conversionFactor = conversionFactor / 10
            valDifference -= 1
        }
    } else {
        while valDifference > 0 {
            conversionFactor = conversionFactor * 10
            valDifference -= 1
        }
    }
    let finish: Double = amount * Double(conversionFactor)
    
    return finish
}
            

}
    
    

