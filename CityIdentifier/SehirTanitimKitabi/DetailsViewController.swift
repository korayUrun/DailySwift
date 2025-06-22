//
//  DetailsViewController.swift
//  SehirTanitimKitabi
//
//  Created by Koray Urun on 20.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sehirIsmiLabel: UILabel!
    @IBOutlet var sehirBolgesiLabel: UILabel!
    
    var secilenSehir : Sehir?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sehirIsmiLabel.text = secilenSehir?.isim
        sehirBolgesiLabel.text = secilenSehir?.bolge
        imageView.image = secilenSehir?.gorsel

        
        
        
        
        
    }
    

    

}
