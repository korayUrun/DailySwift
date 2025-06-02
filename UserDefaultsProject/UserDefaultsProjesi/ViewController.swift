//
//  ViewController.swift
//  UserDefaultsProjesi
//
//  Created by Koray Urun on 2.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var noteTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    @IBOutlet var noteLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedTime = UserDefaults.standard.object(forKey: "time")
        
        if let inputNote = savedNote as? String{
            noteLabel.text = "What to do : \(inputNote)"
            
        }
        
        if let inputTime = savedTime as? String{
            timeLabel.text = "When it will be completed : \(inputTime)"
        }



    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(noteTextField.text!, forKey: "note")
        UserDefaults.standard.set(timeTextField.text!, forKey: "time")

        noteLabel.text = "What to do : \(noteTextField.text!)"
        timeLabel.text = "When it will be completed : \(timeTextField.text!)"
        
        
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let savedNote = UserDefaults.standard.object(forKey :"note")
        let savedTime = UserDefaults.standard.object(forKey :"time")
        
        if (savedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "note")
            noteLabel.text = "What to do :"
        }
        
        if (savedTime as? String ) != nil{
            UserDefaults.standard.removeObject(forKey: "time")
            timeLabel.text = "When it will be completed :"

        }

    }
}

