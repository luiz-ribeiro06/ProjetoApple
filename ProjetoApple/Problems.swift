//
//  Problems.swift
//  ProjetoApple
//
//  Created by found on 08/07/25.
//

import Foundation
import SwiftData

enum Subject: String, Codable, CaseIterable {
    
    case math = "Matemática"
    case chemistry = "Química"
    case geography = "Geografia"
    
    
         
}

enum Exam: String, Codable, CaseIterable {
    case unspecified = "Nenhum"
    case enem = "ENEM"
    case ita = "ITA"
}

// To do: checar se a questão é válida com base no estilo
enum Style: String, Codable, CaseIterable {
    case objective = "Objetiva"
    case subjective = "Subjetiva"
    case trueFalse = "Verdadeiro ou Falso"
}

@Model
class Problems: Identifiable {
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
    
    // Construtor padrão apenas para testes...
    init() {
        self.problemStatement = "Quanto é 2 + 2?"
        self.subject = .math
        self.exam = .enem
        self.style = .objective
        self.possibleAnswers = ["2", "4", "22", "5"]
        self.correctAnswer = 1
    }
    
    init(problemStatement: String, subject: Subject, exam: Exam, style: Style, possibleAnswers: [String], correctAnswer: Int) {
        self.problemStatement = problemStatement
        self.subject = subject
        self.exam = exam
        self.style = style
        self.correctAnswer = correctAnswer
        
        if style == .trueFalse {
            self.possibleAnswers = ["Verdadeiro", "Falso"]
        } else {
            self.possibleAnswers = possibleAnswers
        }
    }
}
