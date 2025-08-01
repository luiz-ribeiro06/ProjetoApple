//
//  MenuView.swift
//  ProjetoApple
//
//  Created by found on 15/07/25.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    @State private var inputText = ""
    @Query(sort: \Problems.problemStatement) private var problems : [Problems]
    @State private var problemShow: Problems?
    
    
    var filteredProblems: [Problems]{
        let filteredProblems = problems.compactMap {question in
            let titleContainerQuery = question.problemStatement.range(of: inputText, options: .caseInsensitive) != nil
            return titleContainerQuery ? question: nil
        }
        return filteredProblems
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(inputText.isEmpty ? problems : filteredProblems ) { question in
                        ProblemCell(problem: question)
                    }
                }
            }
            
            
                .navigationTitle(Text("EstudAí!"))
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "plus")
                                .searchable(text: $inputText)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem (placement: .bottomBar) {
                        HStack {
                            
                            Button(action: {}, label: {
                                VStack (spacing: 4) {
                                    Image(systemName: "house.fill").font(.title)
                                    Text("Início").font(.system(size: 16))
                                    
                                }
                            
                            })
                            Button(action: {}, label: {
                                VStack (spacing: 4) {
                                    Image(systemName: "person.3.sequence.fill").font(.title)
                                    Text("Comunidade").font(.system(size: 16))
                                }
                            })
                            Button(action: {}, label: {
                                VStack (spacing: 4) {
                                    Image(systemName: "chart.bar.fill").font(.title)
                                    Text("Desempenho").font(.system(size: 16))
                                    
                                }
                            })
                            
                            Button(action: {}, label: {
                                VStack (spacing: 4) {
                                    Image(systemName: "person.circle.fill").font(.title)
                                    Text("Perfil").font(.system(size: 16))
                                }
                                
                            })
                            
                        }
                    }
                }
        }
    }
}
#Preview {
    MenuView()
}
                        
                        


