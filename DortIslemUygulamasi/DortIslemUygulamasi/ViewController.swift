//
//  ViewController.swift
//  DortIslemUygulamasi
//
//  Created by Koray Urun on 31.05.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ilkText: UITextField!
    @IBOutlet var ikinciText: UITextField!
    @IBOutlet var sonucLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func toplamaTiklandi(_ sender: Any) {
        //let ilkSayi = Int(ilkText.text!)!
        //let ikinciSayi = Int(ikinciText.text!)!
        //let sonuc = ilkSayi + ikinciSayi
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                let sonuc = ilkSayi + ikinciSayi
                sonucLabel.text = String(sonuc)

            }else{
                sonucLabel.text = "Lütfen sayı giriniz."
                return
            }
        }
        
    }
    
    @IBAction func cikarmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                let sonuc = ilkSayi - ikinciSayi
                sonucLabel.text = String(sonuc)

            }else{
                sonucLabel.text = "Lütfen sayı giriniz."
                return
            }
        }
        
    }
    
    @IBAction func carpmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                let sonuc = ilkSayi * ikinciSayi
                sonucLabel.text = String(sonuc)

            }else{
                sonucLabel.text = "Lütfen sayı giriniz."
                return
            }
        }
        
    }
    
    @IBAction func bolmeTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                let sonuc = ilkSayi / ikinciSayi
                sonucLabel.text = String(sonuc)

            }else{
                sonucLabel.text = "Lütfen sayı giriniz."
                return
            }
        }
        
    }
    
    

}

