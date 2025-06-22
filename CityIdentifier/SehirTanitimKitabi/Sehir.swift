//
//  Sehir.swift
//  SehirTanitimKitabi
//
//  Created by Koray Urun on 20.06.2025.
//

import Foundation
import UIKit

class Sehir {
    
    var isim : String
    var bolge : String
    var gorsel : UIImage
    
    init(isim: String, bolge: String , gorsel: UIImage) {
        self.isim = isim
        self.bolge = bolge
        self.gorsel = gorsel
    }
}
