//
//  Dia.swift
//  Calendo
//
//  Created by Michael Mecham on 5/16/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Dia: Equatable {
    
    var day: Int
    var month: Int
    var year: Int
    var tasks: [Task] = []
    
    init(dia: NSDate) {
        let components: NSDateComponents = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: dia)
        self.day = components.day
        self.month = components.month
        self.year = components.year
    } 
}

func ==(lhs: Dia, rhs: Dia) -> Bool {
    return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
}