//
//  YapilacakView.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import SwiftUI

struct YapilacakView: View {
    var body: some View {
        NavigationView{
            
            List(yapilacaklarDizesi){yapilacak in
                NavigationLink(destination: DetayView(secilenYapilacak: yapilacak), label: {Text(yapilacak.isim)})
                
            }.navigationTitle("Yapilacaklar")
            
        }

    }

}

#Preview {
    YapilacakView()
}
