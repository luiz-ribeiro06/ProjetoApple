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
    @Query(sort: \Expense.date) var expenses: [Expense]
    @State private var expenseToEdit: Expense?

    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit =  expense
                        }
                }
                .onDelete {indexSet in for index in indexSet {
                    context.delete(expenses[index])
                    try! context.save()
                   }
                }
            }
            .navigationTitle("Questões")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){ AddQuestionSheet() }
            .sheet(item: $expenseToEdit){expense in
                UpdateExpenseSheet(expense: expense)
                
            }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus"){
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Sem questões!", systemImage: "")
                    }, description: {
                        Text("Clique abaixo para adicionar questões.")
                    }, actions:{
                        Button("Adicionar questão!"){ isShowingItemSheet = true }
                    })
                    .offset(y:-60)
                    .background(Color.white)
                }
            }
        }
    }
}


struct ExpenseCell: View{
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}

struct AddQuestionSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Tipo de questão", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Enunciado", value: $value, format: .currency(code: "USD"))
        
            }
            .navigationTitle("Nova questão")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Salvar") {
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense)
                        
                        try! context.save()
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateExpenseSheet: View{
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense: Expense
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
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
