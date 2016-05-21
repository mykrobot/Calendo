//
//  Task.swift
//  Calendo
//
//  Created by Michael Mecham on 5/20/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Task {
    
    let name: String
    var isComplete: Bool = false
    var dueDate: NSDate?
    
    init(name: String, dueDate: NSDate? = nil) {
        self.name = name
        self.dueDate = dueDate
    }
}