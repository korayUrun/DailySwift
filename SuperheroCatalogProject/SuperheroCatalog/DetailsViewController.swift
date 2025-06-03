//
//  DetailsViewController.swift
//  SuperheroCatalog
//
//  Created by Koray Urun on 3.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    var secilenKahramanIsmi = ""
    var secilenKahramanGorselIsmin = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: secilenKahramanGorselIsmin)
        label.text = secilenKahramanIsmi
        
        
        

    }
    


}
