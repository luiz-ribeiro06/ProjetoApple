//
//  Problems.swift
//  ProjetoApple
//
//  Created by found on 08/07/25.
//

import Foundation

enum Subject {
    case math
    case chemistry
    case geography
}

class Problems {
    var problemStatement: String
    var subject: Subject
    var alternatives: [String]
    var correctAnswer: Int
    
    func checkIfCorrect(selectedAlternative: Int) -> Bool {
        if selectedAlternative == self.correctAnswer {
            return true
        }
        return false
    }
    
    init(problemStatement: String, subject: Subject, alternatives: [String], correctAnswer: Int) {
        self.problemStatement = problemStatement
        self.subject = subject
        self.alternatives = alternatives
        self.correctAnswer = correctAnswer
    }
}
