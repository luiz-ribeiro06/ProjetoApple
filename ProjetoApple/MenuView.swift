//
//  MenuView.swift
//  ProjetoApple
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            
            HStack{
                TextField("Procurar...", text: .constant(""))
                    .padding(8)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .frame(maxWidth: 400, alignment: .top)
                    .frame(maxWidth: .infinity, maxHeight:
                            .infinity, alignment: .top)
                    .padding()
                Image(systemName: "magnifyingglass")
                    .frame(maxWidth: 60, maxHeight:
                            354, alignment: .top).font(.largeTitle)
            }
                
            }
            
            
        ZStack {
          
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 100)
                Button(action: {}){
                    Image(systemName: "house" ).font(.largeTitle)
                        
                }
                
            }
        }

        }
       
    }


#Preview {
    MenuView()
}
