//
//  UploadViewController.swift
//  FotografPaylasmaApp
//
//  Created by Koray Urun on 16.07.2025.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UploadViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var yorumTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
        
    }
    
    @objc func gorselSec(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func uploadButtonTiklandi(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            
            imageReference.putData(data, metadata: nil) { (storagemetadata, error) in
                if error != nil {
                    self.hataMesaji(title: "Hata", message: error?.localizedDescription ?? "Hata aldiniz,tekrar deneyiniz")
                } else {
                    imageReference.downloadURL() { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString

                            if let imageUrl = imageUrl {
                                
                                let firestoreDatabase = Firestore.firestore()
                                
                                let firestorePost = ["gorselurl" : imageUrl, "yorum" : self.yorumTextField.text!,
                                                     "email" : Auth.auth().currentUser!.email! ,
                                                     "tarih" : FieldValue.serverTimestamp()] as [String : Any]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost){
                                    (error) in
                                    if error != nil {
                                        self.hataMesaji(title: "Hata", message: error?.localizedDescription ?? "Hata aldiniz,tekrar deneyiniz" )
                                    } else {
                                        
                                        self.imageView.image = UIImage(named: "addPhoto")
                                        self.yorumTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
            }
        }
            
        
        
    }
    
    func hataMesaji(title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    
        
    }
    

}
