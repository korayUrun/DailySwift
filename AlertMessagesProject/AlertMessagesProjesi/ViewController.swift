//
//  ViewController.swift
//  AlertMessagesProjesi
//
//  Created by Koray Urun on 2.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var password2TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        
        if emailTextField.text == ""{
            alertOlustur(inputTitle: "Hata", inputMessage: "Email Eksik")
        } else if passwordTextField.text == "" {
            alertOlustur(inputTitle: "Hata", inputMessage: "Parola eksik")
        } else if passwordTextField.text != password2TextField.text {
            alertOlustur(inputTitle: "Hata", inputMessage: "Parolalar uyuşmuyor")
        } else {
            alertOlustur(inputTitle: "Tebrikler!", inputMessage: "Kullaniciniz kaydedildi")
        }
        
        

        let uyariMesaji = UIAlertController(title: "Hata Mesajı", message: "Email yanlış verildi", preferredStyle:  UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // OK butonuna basınca olacaklar
            print("ok butonuna tiklandi")
        }
        
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true, completion: nil)


    }
    
    func alertOlustur(inputTitle : String, inputMessage : String){
        
        let uyariMesaji = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle:  UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // OK butonuna basınca olacaklar
            print("ok butonuna tiklandi")
        }
        
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true, completion: nil)
        
        
    }
    
    
    
}

