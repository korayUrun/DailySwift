//
//  DetailesViewController.swift
//  ShoppingList
//
//  Created by Koray Urun on 1.07.2025.
//

import UIKit
import CoreData

class DetailesViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var isimTextLabel: UITextField!
    @IBOutlet var fiyatTextLabel: UITextField!
    @IBOutlet var bedenTextLable: UITextField!
    @IBOutlet var kaydetButton: UIButton!
    
    var secilenUrunIsmi = ""
    var secilenUrunUUID: UUID?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsmi != "" {
            
            kaydetButton.isHidden = true
            //Core Data secilen urun bilgilerini goster
            
            if let uuidString = secilenUrunUUID?.uuidString {
               
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Alisveris")
                fetchRequest.predicate = NSPredicate(format: "id == %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                
                do{
                    let sonuclar = try context.fetch(fetchRequest)
                    
                    if sonuclar.count > 0 {
                        
                        for sonuc in sonuclar as! [NSManagedObject] {
                            if let isim = sonuc.value(forKey: "isim") as? String {
                                isimTextLabel.text = isim
                            }
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int {
                                fiyatTextLabel.text = String(fiyat)
                            }
                            if let beden = sonuc.value(forKey: "beden") as? String {
                                bedenTextLable.text = beden
                            }
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data {
                                let image = UIImage(data: gorselData)
                                imageView.image = image
                            }
                        }
                        
                    }
                    
                }catch {
                    print("Hata Var")
                }
                
        
                
            }
            
            
        }else{
            kaydetButton.isHidden = false
            kaydetButton.isEnabled = false
            isimTextLabel.text = ""
            fiyatTextLabel.text = ""
            bedenTextLable.text = ""
            
        }
        
        
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target:self,action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
    }
    
    @objc func gorselSec() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        kaydetButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func klavyeyiKapat() {
        view.endEditing(true)
        
    }
    

    @IBAction func kaydetButtonTiklandi(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(isimTextLabel.text!, forKey: "isim")
        alisveris.setValue(bedenTextLable.text!, forKey: "beden")
        
        // fiyat string geleceği için böyle yapıyoruz
        if let fiyat = Int(fiyatTextLabel.text!){
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        
        // universal unique id
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        
        
        do{
            try context.save()
            print("kayit edildi")
        } catch {
            print("hata var")
        }

        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
