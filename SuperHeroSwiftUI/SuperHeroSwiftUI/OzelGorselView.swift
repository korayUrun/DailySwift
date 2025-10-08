//
//  OzelGorselView.swift
//  SuperHeroSwiftUI
//
//  Created by Koray Urun on 8.10.2025.
//

import SwiftUI

struct OzelGorselView: View {
    var image : Image
    
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 5))
            .shadow(radius: 12)
    }
}

#Preview {
    OzelGorselView(image: Image("batman"))
}
