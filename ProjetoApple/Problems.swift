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
    
    init(problemStatement: String, subject: Subject) {
        self.problemStatement = problemStatement
        self.subject = subject
    }
}
