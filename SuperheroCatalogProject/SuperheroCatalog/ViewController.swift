//
//  ViewController.swift
//  SuperheroCatalog
//
//  Created by Koray Urun on 3.06.2025.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Etçimman")
        superKahramanIsimleri.append("Mario Gomez")
        superKahramanIsimleri.append("Quuaaaresmaaaaa")
        superKahramanIsimleri.append("Rafatullah")

        superKahramanGorselIsimleri.append("batman")
        superKahramanGorselIsimleri.append("etcimman")
        superKahramanGorselIsimleri.append("mariogomez")
        superKahramanGorselIsimleri.append("quaresma")
        superKahramanGorselIsimleri.append("rafaman")

        
        
        
        
        
        
    }
    // numberOfRowsInSection -> kaç tane row olacak
    // cellForRow atIndexPath -> hücrenin içerisinde neler gösterilecek

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            superKahramanIsimleri.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmin = secilenGorsel
        }
    }
    
    
    
    
}




