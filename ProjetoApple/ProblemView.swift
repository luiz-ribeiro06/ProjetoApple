//
//  ProblemView.swift
//  ProjetoApple
//
//  Created by found on 17/07/25.
//

import SwiftUI

struct ProblemView: View {
    @State var problem: Problems
    @ObservedObject var user: User
    
    @State var selectedAnswer: Int?
    @State var subjectiveAnswer: String = ""
    
    @State var showAnswer: Bool = false
    @State var userConfirmedCorrectness: Bool? = nil
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(problem.problemStatement)
                    .padding()
                
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
                .padding([.leading, .bottom])
                
                // Answer Section
                if problem.style == .subjective {
                    TextField("Digite sua resposta", text: $subjectiveAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disabled(showAnswer)
                } else {
                    ForEach(Array(problem.possibleAnswers.enumerated()), id: \.offset) { index, answer in
                        Button(action: {
                            selectedAnswer = index
                        }) {
                            HStack {
                                Image(systemName: selectedAnswer == index ? "largecircle.fill.circle" : "circle")
                                Text(answer)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(
                                showAnswer ?
                                (index == problem.correctAnswer ? Color.green.opacity(0.2) :
                                 (selectedAnswer == index ? Color.red.opacity(0.2) : Color.gray.opacity(0.1)))
                                : Color.gray.opacity(0.1)
                            )
                            .cornerRadius(8)
                        }
                        .disabled(showAnswer)
                    }
                }
                
                if showAnswer {
                    VStack(alignment: .leading) {
                        Divider()
                            .padding(.vertical)
                        
                        Text("Resposta Correta:")
                            .fontWeight(.bold)
                        
                        if problem.style == .subjective && !problem.possibleAnswers.isEmpty {
                            Text(problem.possibleAnswers[0])
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                        } else if problem.style != .subjective {
                            Text(problem.possibleAnswers[problem.correctAnswer])
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    if !showAnswer {
                        Button(problem.style == .subjective ? "Enviar Resposta" : "Confirmar") {
                            showAnswer = true
                            if problem.style != .subjective {
                                userConfirmedCorrectness = (selectedAnswer == problem.correctAnswer)
                                if userConfirmedCorrectness == true {
                                    user.correctAnswers += 1
                                } else {
                                    user.wrongAnswers += 1
                                }
                            }
                        }
                        .disabled(problem.style == .objective && selectedAnswer == nil)
                    } else {
                        if problem.style == .subjective && userConfirmedCorrectness == nil {
                            HStack {
                                Button("Acertei") {
                                    userConfirmedCorrectness = true
                                    user.correctAnswers += 1
                                }
                                .buttonStyle(.borderedProminent)
                                
                                Button("Errei") {
                                    userConfirmedCorrectness = false
                                    user.wrongAnswers += 1
                                }
                                .buttonStyle(.bordered)
                            }
                        } else {
                            Button("Próxima") {
                                // Navegar para próxima questão
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
            }
            .toolbarBackground(.gray.opacity(0.2), for: .bottomBar)
            .toolbarBackground(.visible, for: .bottomBar)
            .navigationTitle("Responder")
        }
    }
}

#Preview {
    NavigationStack {
        ProblemView(
            problem: Problems(
                problemStatement: "Explique a teoria da relatividade de Einstein em poucas palavras.",
                subject: .math,
                exam: .enem,
                style: .subjective,
                possibleAnswers: ["A teoria da relatividade estabelece que as leis da física são as mesmas para todos os observadores não acelerados."],
                correctAnswer: 0
            ),
            user: User()
        )
    }
}
