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
            
        
            
            VStack {
                TextField("Enter Text", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onSubmit {
                        print("Submitted: \(inputText)")
                       
                    }
            }
            Spacer()
            
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
                                    Image(systemName: "hourglass").font(.title)
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
                        
                        

