//
//  MenuView.swift
//  ProjetoApple
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct MenuView: View {
    @State private var inputText = ""
    
    
    var body: some View {
        
        

        
        NavigationStack {
            
        Text("")
            
                .navigationTitle(Text("App de Questões"))
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
                        
                        


