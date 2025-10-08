//
//  DetayView.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import SwiftUI

struct DetayView: View {
    
    var secilenYapilacak : YapilacakModeli
    @State var yapildi = false
    
    var body: some View {
        VStack{
            Text(secilenYapilacak.isim)
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundStyle(self.yapildi ? .green : .red)
            Text(secilenYapilacak.tanım)
                .font(.title)
                .padding()
            
            YapildiButtonu(yapildiYapilmadi: $yapildi)
        }
    }
}

#Preview {
    DetayView(secilenYapilacak:birinciYapilacak)
}
