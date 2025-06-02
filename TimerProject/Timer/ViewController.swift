//
//  ViewController.swift
//  Timer
//
//  Created by Koray Urun on 2.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    var timer = Timer()
    var kalanZaman = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kalanZaman = 15
        
        label.text = "Zaman : \(kalanZaman)"
        
        
        
        
    }

    
    @IBAction func startButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFonksiyonu), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func timerFonksiyonu(){
        
        label.text = "Zaman : \(kalanZaman)"
        kalanZaman -= 1
        
        if kalanZaman == 0 {
            label.text = "Süre Bitti"
            timer.invalidate()
            kalanZaman = 15
        }
        
        
    }
    

}

