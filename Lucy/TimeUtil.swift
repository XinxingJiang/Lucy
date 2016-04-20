//
//  TimeUtil.swift
//  BlankParseProject
//
//  Created by Xinxing Jiang on 10/14/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation

class TimeUtil {
    // return an array of time fields given an array of NSCalendarUnit
    class func getTime(timeComponents timeComponents: [NSCalendarUnit]) -> [Int] {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        var fields = [Int]()
        
        fields = timeComponents.map { (timeComponent) -> Int in
            return calendar.component(timeComponent, fromDate: date)
        }
        return fields
    }
}