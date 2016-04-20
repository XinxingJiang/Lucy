//
//  MathUtil.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/15/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import GameKit

class MathUtil {
    class func indicator(x: Double) -> Int {
        return (x >= 0 ? 1 : -1)
    }
    
    class func indicator(x: Bool) -> Int {
        return (x ? 1 : -1)
    }
    
    // generate a random integer in range [low, high]
    class func randomNumber(low low: Int, high: Int) -> Int? {
        if low <= high {
            return Int(arc4random_uniform(UInt32(high - low))) + low
        }
        return nil
    }
    
    // MARK: - Sample uniform distribution
    
    // generate uniform distribution in range [low, high]
    class func sampleUniformDistribution(low low: Double, high: Double) -> Double? {
        if low <= high {
            return Double(arc4random()) / Double(UINT32_MAX) * (high - low) + low
        }
        return nil
    }
    
    // MARK: - Sample Gaussian distribution
    
    // Gaussian distribution in range [mean - 3 * deviation, mean + 3 * deviation]
    class func sampleGaussianDistribution(mean mean: Float, deviation: Float) -> Int {
        let distribution = GKGaussianDistribution(randomSource: GKRandomSource(), mean: mean, deviation: deviation)
        return distribution.nextInt()
    }

}