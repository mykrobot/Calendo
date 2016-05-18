//
//  Date.swift
//  Calendo
//
//  Created by Michael Mecham on 5/16/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Date: Equatable {
    
    var day: Int
    var month: Int
    var year: Int
    
    init(date: NSDate) {
        let components: NSDateComponents = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: date)
        self.day = components.day
        self.month = components.month
        self.year = components.year
    } 
}

func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
}