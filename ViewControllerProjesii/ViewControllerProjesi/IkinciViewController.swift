//
//  IkinciViewController.swift
//  ViewControllerProjesi
//
//  Created by Koray Urun on 2.06.2025.
//

import UIKit

class IkinciViewController: UIViewController {
    @IBOutlet var ikinciLabel: UILabel!
    
    @IBOutlet var bulunanSifreLabel: UILabel!
    
    var verilenSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        bulunanSifreLabel.text = verilenSifre
    }
    

   

}
