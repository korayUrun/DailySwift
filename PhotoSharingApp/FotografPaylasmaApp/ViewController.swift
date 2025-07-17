//
//  ViewController.swift
//  FotografPaylasmaApp
//
//  Created by Koray Urun on 14.07.2025.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var sifreTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func girisYapTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!)
            {(authdataresult, error) in
                if error != nil {
                    self.hataMesaji(titleInput: "hata", messageInput: error?.localizedDescription ?? "Hata aldiniz tekrar deneyin")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            self.hataMesaji(titleInput: "Hata", messageInput: "Email ve parola giriniz")
            
        }
        
        
        
    }
    

    @IBAction func kayitOlTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            // kayit et
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata aldiniz tekrar deneyin")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            hataMesaji(titleInput: "Hata", messageInput: "Kullanici adi ve sifre giriniz")
            
        }
    }
    
    
    func hataMesaji(titleInput : String , messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    
}

