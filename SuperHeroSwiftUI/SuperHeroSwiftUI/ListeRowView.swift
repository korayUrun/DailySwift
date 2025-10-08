//
//  ListeRowView.swift
//  SuperHeroSwiftUI
//
//  Created by Koray Urun on 8.10.2025.
//

import SwiftUI

struct ListeRowView: View {
    var superkahraman : SuperKahraman
    var body: some View {

        HStack{
            Image(superkahraman.gorselIsmi)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 75,alignment: .leading)
                .clipShape(Circle())
            Spacer()
            VStack{
                Text(superkahraman.isim).font(.title2).bold()
                
                Text(superkahraman.gercekIsim).font(.title3)

            }
            Spacer()

        }
    }
}

#Preview {
    ListeRowView(superkahraman: batman)
}
