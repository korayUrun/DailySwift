//
//  DetailView.swift
//  SuperHeroSwiftUI
//
//  Created by Koray Urun on 8.10.2025.
//

import SwiftUI

struct DetailView: View {
    
    var secilenKahraman : SuperKahraman
    var body: some View {
        
        VStack{
            MapView(coordinate: secilenKahraman.koordinatLokasyonu)
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .ignoresSafeArea()
            
            OzelGorselView(image: Image(secilenKahraman.gorselIsmi))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.3, alignment: .center)
                .offset(y : UIScreen.main.bounds.height * -0.20)
                
            
        }
        
        VStack{
            HStack{
                Text(secilenKahraman.isim)
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                Spacer()
                
                Text(secilenKahraman.gercekIsim)
                    .font(.largeTitle)
                    .foregroundStyle(.orange)
            }
            
            HStack{
                Text(secilenKahraman.sehir).bold()
                Spacer()
                Text(secilenKahraman.meslek).bold()
            }
            
        }.padding()
            .offset(y: UIScreen.main.bounds.height * -0.20)
        Spacer()
        
        
        
    }
}

#Preview {
    DetailView(secilenKahraman: superman)
}
