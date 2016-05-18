//
//  DateController.swift
//  Calendo
//
//  Created by Michael Mecham on 5/17/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class DateController {
    
    static let sharedController = DateController()
    
    var dateArray: [Date] = []
    
    let calendar = NSCalendar.currentCalendar()
    
    init() {
        checkForDate()
    }
    
    func checkForDate() {
        if dateArray.isEmpty {
            calculateDays()
        } else if dateArray[2] != Date(date: NSDate()) {
            updateCalendar()
        }
    }
    
    func calculateDays() {
        let ereyesterday: Date = Date(date: calendar.dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: []) ?? NSDate())
        let yesterday: Date = Date(date: calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: []) ?? NSDate())
        let today: Date = Date(date: NSDate())
        let tomorrow: Date = Date(date: calendar.dateByAddingUnit(.Day, value: +1, toDate: NSDate(), options: []) ?? NSDate())
        let overmorrow: Date = Date(date: calendar.dateByAddingUnit(.Day, value: +2, toDate: NSDate(), options: []) ?? NSDate())
        
        dateArray = [ereyesterday, yesterday, today, tomorrow, overmorrow]
    }
    
    func updateCalendar() {
        dateArray.removeAtIndex(0)
        let newOvermorrow: Date = Date(date: calendar.dateByAddingUnit(.Day, value: +2, toDate: NSDate(), options: []) ?? NSDate())
        dateArray.append(newOvermorrow)
    }
    
}