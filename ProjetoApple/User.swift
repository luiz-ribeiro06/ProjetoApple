//
//  User.swift
//  ProjetoApple
//
//  Created by found on 22/07/25.
//

import Foundation

class User: Identifiable {
    let id = UUID()
    var correctAnswers: Int
    var wrongAnswers: Int
    
    func getTotalAnswers() -> Int {
        return correctAnswers + wrongAnswers
    }
    
    init() {
        self.correctAnswers = 0
        self.wrongAnswers = 0
    }
}
