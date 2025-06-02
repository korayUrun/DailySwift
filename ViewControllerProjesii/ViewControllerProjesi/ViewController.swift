//
//  ViewController.swift
//  ViewControllerProjesi
//
//  Created by Koray Urun on 1.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var birinciLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    var alinanSifre = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func kontrolEtTiklandi(_ sender: Any) {
        
        alinanSifre = textField.text!
        if alinanSifre == "koray"{
            performSegue(withIdentifier: "toIkinciVC", sender: nil)
        }else {
            birinciLabel.text = "Şifreniz yanlış,lütfen tekrar deneyiniz."
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toIkinciVC" {
            
            let destinationVC = segue.destination as! IkinciViewController
            destinationVC.verilenSifre = alinanSifre
            
        }
        
    }
    
    

}

