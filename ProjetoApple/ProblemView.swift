//
//  ProblemView.swift
//  ProjetoApple
//
//  Created by found on 17/07/25.
//

import SwiftUI

struct ProblemView: View {
    @State var problem: Problems
    
    @State var selectedAnswer: Int?
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(problem.problemStatement)
                HStack {
                    Text("#\(problem.subject.rawValue.lowercased())")
                        .padding(3.5)
                        .background(.blue)
                        .cornerRadius(7.5)
                    if problem.exam != .unspecified {
                        Text("#\(problem.exam.rawValue.lowercased())")
                            .padding(3.5)
                            .background(.blue)
                            .cornerRadius(5)
                    }
                }
                ForEach(Array(problem.possibleAnswers.enumerated()), id: \.offset) { index, answer in
                    Button(action: {
                        // To do: implementar ação ao selecionar uma alternativa
                    }) {
                        Text(answer)
                            .padding(3.5)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
            }
        }
    }
}

#Preview {
    ProblemView(problem: Problems(problemStatement: "Quanto é 2 + 2?", subject: .math, exam: .enem, style: .objective, possibleAnswers: ["2", "4", "22", "5"], correctAnswer: 1))
}
