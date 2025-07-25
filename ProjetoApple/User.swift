//
//  User.swift
//  ProjetoApple
//
//  Created by found on 22/07/25.
//

import Foundation

class User: ObservableObject {
    @Published var correctAnswers: Int
    @Published var wrongAnswers: Int
    
    func getTotalAnswers() -> Int {
        return correctAnswers + wrongAnswers
    }
    
    init() {
        self.correctAnswers = 0
        self.wrongAnswers = 0
    }
}
