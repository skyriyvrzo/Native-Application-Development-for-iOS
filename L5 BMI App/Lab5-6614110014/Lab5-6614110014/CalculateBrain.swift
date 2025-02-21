//
//  CalculatorBrain.swift
//  Lab5-6614110014
//
//  Created by MII-MAC-21 on 19/12/2567 BE.
//  Copyright © 2567 BE Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.2f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No comment"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi =  BMI(value: bmiValue, advice: "กินเยอะๆหน่อย", color:.orange)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "กินแบบนี้แหละ", color:.cyan)
        } else {
            bmi = BMI(value: bmiValue, advice: "กินน้อยๆหน่อย", color:.red)
        }
    }
}
