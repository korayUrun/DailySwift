//
//  YapilacakModeli.swift
//  VerilerSwiftUI
//
//  Created by Koray Urun on 6.10.2025.
//

import Foundation

struct YapilacakModeli: Identifiable {
    var id: UUID = UUID()
    var isim: String
    var tanım: String
}
var birinciYapilacak = YapilacakModeli(isim : "Yoğurt Al" , tanım : "Eve Gelirken Yoğurt Al")
var ikinciYapilacak = YapilacakModeli(isim : "Arabayi Yikat" , tanım : "Arabayi yikatmayi unutma")
var ucuncuYapilacak = YapilacakModeli(isim : "Bahce Temizle" , tanım : "Supurgerge Almayi unutma ")

var yapilacaklarDizesi = [birinciYapilacak,ikinciYapilacak,ucuncuYapilacak]
