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
    
    @State var showAnswer: Bool = false
    
    var body: some View {
        HStack (alignment: .top){
            VStack(alignment: .leading) {
                Text(problem.problemStatement)
                    .padding(3.5)
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
                        selectedAnswer = index
                    }) {
                        Text(answer)
                            .frame(minWidth: 30)
                            .padding(3.5)
                            .background(selectedAnswer == index ? Color.blue.opacity(0.3) : Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                    .disabled(showAnswer)
                }
                if showAnswer {
                    Text(selectedAnswer == problem.correctAnswer ? "Correto!" : "Errado!")
                        .transition(.opacity)
                        .animation(.easeInOut, value: showAnswer)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                if !showAnswer {
                    Button("Responder") {
                        withAnimation {
                            showAnswer = true
                        }
                    }
                } else {
                    Button("Prosseguir") {
                        // To do
                    }
                    .transition(.opacity)
                    .animation(.easeInOut, value: showAnswer)
                }
            }
        }
        .toolbarBackground(.gray.opacity(0.2), for: .bottomBar)
        .toolbarBackground(.visible, for: .bottomBar)
    }
}

#Preview {
    NavigationStack {
        ProblemView(problem: Problems(problemStatement: "Quanto é 2 + 2?", subject: .math, exam: .enem, style: .objective, possibleAnswers: ["2", "4", "22", "5"], correctAnswer: 1))
    }
}
