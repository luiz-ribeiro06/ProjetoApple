//
//  Expense.swift
//  ProjetoApple
//
//  Created by found on 25/07/25.
//

import Foundation
import SwiftData

@Model
class Expense{
    var name: String
    var value: Double
    var date: Date
    
    init(name: String, date: Date,value: Double){
        self.value = value
        self.name = name
        self.date = date
    }
}
