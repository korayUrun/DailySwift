//
//  ContentView.swift
//  SuperHeroSwiftUI
//
//  Created by Koray Urun on 7.10.2025.
//

import SwiftUI

struct ListeView: View {
    var body: some View {
        NavigationView{
            List(superKahramanDizisi){superkahraman in
                NavigationLink(destination: DetailView(secilenKahraman: superkahraman), label: {
                    ListeRowView(superkahraman: superkahraman)
                }
                )
            }.navigationTitle(Text("Super Hero Catalog"))
        }
        
        
    }
}

#Preview {
    ListeView()
}
