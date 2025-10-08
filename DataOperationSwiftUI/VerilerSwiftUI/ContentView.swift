//
//  ContentView.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State var isim = "Ali Koray Ürün"
    var body: some View {
        VStack {
            Text(isim)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                isim = "Batman"
            }, label: {
                Text("Change name")
            })
            
            TextField("Enter your name", text: $isim)
                .frame(width : UIScreen.main.bounds.width * 0.7, height: 70, alignment: .center)
                .foregroundStyle(.green)
                .background(.orange)
                .multilineTextAlignment(.center)
                
        }
    }
}

#Preview {
    ContentView()
}
