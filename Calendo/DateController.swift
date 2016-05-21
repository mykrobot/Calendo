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
    
    var diaArray: [Dia] = []
    
    let calendar = NSCalendar.currentCalendar()
    
    init() {
        checkForDate()
    }
    
    func checkForDate() {
        if diaArray.isEmpty {
            calculateDays()
        } else if diaArray[2] != Dia(dia: NSDate()) {
            updateCalendar()
        }
    }
    
    func calculateDays() {
        let ereyesterday: Dia = Dia(dia: calendar.dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: []) ?? NSDate())
        let yesterday: Dia = Dia(dia: calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: []) ?? NSDate())
        let today: Dia = Dia(dia: NSDate())
        let tomorrow: Dia = Dia(dia: calendar.dateByAddingUnit(.Day, value: +1, toDate: NSDate(), options: []) ?? NSDate())
        let overmorrow: Dia = Dia(dia: calendar.dateByAddingUnit(.Day, value: +2, toDate: NSDate(), options: []) ?? NSDate())
        
        diaArray = [ereyesterday, yesterday, today, tomorrow, overmorrow]
    }
    
    func updateCalendar() {
        diaArray.removeAtIndex(0)
        let newOvermorrow: Dia = Dia(dia: calendar.dateByAddingUnit(.Day, value: +2, toDate: NSDate(), options: []) ?? NSDate())
        diaArray.append(newOvermorrow)
    }
    
    func addTaskToDia(task: Task, dia: Dia) {
        if let index = diaArray.indexOf(dia) {
            diaArray[index].tasks.append(task)
        }
    }
    
}