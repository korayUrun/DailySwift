//
//  YapildiButtonu.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import SwiftUI

struct YapildiButtonu: View {
    
    @Binding var yapildiYapilmadi : Bool
    
    var body: some View {
        Button(action: {
            self.yapildiYapilmadi.toggle()
        }, label: {Text("Yapildi/Yapilmadi")
                .font(.title)
                .padding()
        }
        )
    }
}


