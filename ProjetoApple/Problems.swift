//
//  Problems.swift
//  ProjetoApple
//
//  Created by found on 08/07/25.
//

import Foundation

enum Subject: String {
    case math = "Matemática"
    case chemistry = "Química"
    case geography = "Geografia"
}

enum Exam: String {
    case unspecified = "Nenhum"
    case enem = "ENEM"
    case ita = "ITA"
}

class Problems: Identifiable {
    let id = UUID()
    var problemStatement: String
    var subject: Subject
    var exam: Exam
    var alternatives: [String]
    var correctAnswer: Int
    
    func checkIfCorrect(selectedAlternative: Int) -> Bool {
        return selectedAlternative == self.correctAnswer
    }
    
    init(problemStatement: String, subject: Subject, exam: Exam, alternatives: [String], correctAnswer: Int) {
        self.problemStatement = problemStatement
        self.subject = subject
        self.exam = exam
        self.alternatives = alternatives
        self.correctAnswer = correctAnswer
    }
}
