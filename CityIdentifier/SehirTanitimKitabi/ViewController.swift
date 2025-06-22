//
//  ViewController.swift
//  SehirTanitimKitabi
//
//  Created by Koray Urun on 20.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Sehirler
        
        let istanbul = Sehir(isim: "Istabul", bolge: "Marmara", gorsel: UIImage(named: "istanbul")!)
        let ankara = Sehir(isim: "Ankara", bolge: "Ic Anadolu", gorsel: UIImage(named: "ankara")!)
        let izmir = Sehir(isim: "Izmir", bolge: "Ege", gorsel: UIImage(named: "izmir")!)
        let antalya = Sehir(isim: "Antalya", bolge: "Akdeniz", gorsel: UIImage(named: "antalya")!)
        let adana = Sehir(isim: "Adana", bolge: "Akdeniz", gorsel: UIImage(named: "adana")!)

        sehirDizisi = [istanbul,ankara,izmir,antalya,adana]
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
            
        }
    }
    
    
}

