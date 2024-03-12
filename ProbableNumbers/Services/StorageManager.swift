//
//  Score.swift
//  ProbableNumbers
//
//  Created by Pavel Gribachev on 12.03.2024.
//

import Foundation

final class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    func computeScore(value: Int, target: Int) -> Int {
        let difference = abs(value - target)
        return 100 - difference
    }
    
    func calculateAlpha(_ value: Int, target: Int) -> Double {
        
        let value = Double(computeScore(value: value, target: target)) / 100
        let roundValue = round(value * 10) / 10
        
        print(roundValue)
        return roundValue
    }
    
    func randomNumber() -> Int {
        return Int.random(in: 5...95)
    }
    
}
