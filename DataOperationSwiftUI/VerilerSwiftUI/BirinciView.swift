//
//  BirinciView.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import SwiftUI

struct BirinciView: View {
    @State var number = 0
    @State var willRepresent = false
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    number -= 1
                }, label: {
                    Text("-").font(.largeTitle)
                })
                
                Text(String(number))
                    .font(.largeTitle)
                
                Button(action: {
                    number += 1
                }, label: {
                    Text("+").font(.largeTitle)
                })
                
            }
            Button(action: {
                willRepresent.toggle()
            }, label: {
                Text("Ikinci View a git")
                    .padding()
                    .font(.largeTitle)
                    .sheet(isPresented: $willRepresent, content: {IkinciView()})
            })
        }
    }
}

#Preview {
    BirinciView()
}
