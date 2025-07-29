//
//  ContentView.swift
//  ProjetoApple
//
//  Created by found on 25/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isShowingItemSheet = false
    @Environment(\.modelContext) var context
    //query com base na data
    @Query var problems: [Problems]
    @State var problemToEdit: Problems?

    var body: some View {
        NavigationStack{
            List{
                ForEach(problems) { problem in
                    ProblemCell(problem: problem)
                        .onTapGesture {
                            problemToEdit =  problem
                        }
                }
                .onDelete {indexSet in for index in indexSet {
                    context.delete(problems[index])
                    try! context.save()
                   }
                }
            }
            .navigationTitle("Questões")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){ AddProblemSheet() }
            .sheet(item: $problemToEdit){problem in
                UpdateProblemSheet(problem: problem)
                
            }
            .toolbar{
                if !problems.isEmpty {
                    Button("Adicionar questão", systemImage: "plus"){
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if problems.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Sem questões!", systemImage: "")
                    }, description: {
                        Text("Clique abaixo para adicionar questões.")
                    }, actions:{
                        Button("Adicionar questão"){ isShowingItemSheet = true }
                    })
                    .offset(y:-60)
                }
            }
        }
    }
}


struct ProblemCell: View{
    
    let problem: Problems
    
    var body: some View {
        HStack {
           
            
            Text(problem.subject.rawValue)
                .frame(width: 70, alignment: .leading)
            Text(problem.problemStatement)
            Spacer()
            Text(problem.style.rawValue)
        }
    }
}

struct AddProblemSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @State var statement: String = ""
    @State var subject: Subject = .math
    @State var exam: Exam = .enem
    @State var style: Style = .objective
    @State var possibleAnswers: [String] = []
    @State var correctAnswer: Int = 0
    
    var body: some View{
        NavigationStack{
            Form{
                Section {
                    TextField("Enunciado...", text: $statement, axis: .vertical)
                    Picker("Estilo", selection: $style) {
                        Text("Objetiva").tag(Style.objective)
                        Text("Verdadeiro ou Falso").tag(Style.trueFalse)
                        Text("Subjetiva").tag(Style.subjective)
                    }
                    Picker("Disciplina", selection: $subject) {
                        Text("Matemática").tag(Subject.math)
                        Text("Química").tag(Subject.chemistry)
                        Text("Geografia").tag(Subject.geography)
                    }
                    Picker("Vestibular", selection: $exam) {
                        Text("Nenhum").tag(Exam.unspecified)
                        Text("ENEM").tag(Exam.enem)
                        Text("ITA").tag(Exam.ita)
                    }
                }
                if style == .subjective {
                    TextField("Resposta...", text: $possibleAnswers[0], axis: .vertical)
                } else if style == .objective {
                    // To do...
                }
            }
            .navigationTitle("Adicionar Questão")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Salvar") {
                        let problem = Problems(problemStatement: statement, subject: subject, exam: exam, style: style, possibleAnswers: possibleAnswers, correctAnswer: correctAnswer)
                        context.insert(problem)
                        
                        try! context.save()
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateProblemSheet: View{
    @Environment(\.dismiss) private var dismiss
    @Bindable var problem: Problems
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $problem.problemStatement)
            }
            .navigationTitle("Edit expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Done"){ dismiss() }
                }
            }
            
        }
    }
}

#Preview { ContentView() }
