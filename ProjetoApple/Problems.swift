//
//  Problems.swift
//  ProjetoApple
//
//  Created by found on 08/07/25.
//

import Foundation
import SwiftData

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

// To do: checar se a questão é válida com base no estilo
enum Style: String {
    case objective = "Objetiva"
    case subjective = "Subjetiva"
    case trueFalse = "Verdadeiro ou Falso"
}

class Problems: Identifiable {
    let id = UUID()
    var problemStatement: String
    var subject: Subject
    var exam: Exam
    var style: Style
    var possibleAnswers: [String]
    var correctAnswer: Int
    
    // Verifica se a questão criada é válida com base em seu estilo. No caso de trueFalse, suas alternativas já foram criadas automaticamente,
    // então não há necessidade de verificar se elas existem.
    func isValid() -> Bool {
        if self.problemStatement.isEmpty {
            return false
        }
        
        switch self.style {
        case .objective:
            return self.possibleAnswers.count >= 4
        case .subjective:
            return self.possibleAnswers.count == 1
        case .trueFalse:
            return true
        }
    }
    
    init(problemStatement: String, subject: Subject, exam: Exam, style: Style, possibleAnswers: [String], correctAnswer: Int) {
        self.problemStatement = problemStatement
        self.subject = subject
        self.exam = exam
        self.style = style
        self.correctAnswer = correctAnswer
        
        switch self.style {
        case .trueFalse:
            self.possibleAnswers = ["Verdadeiro", "Falso"]
        case .objective, .subjective:
            self.possibleAnswers = possibleAnswers
        }
    }
}
