//
//  ViewController.swift
//  GestureSensors
//
//  Created by Koray Urun on 2.06.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselDegistir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    
    }
    
    @objc func gorselDegistir() {
        
        if imageView.image == UIImage(named: "ankara.jpeg") {
            imageView.image = UIImage(named: "istanbu.jpg")
            label.text = "İstanbul"
            
        } else {
            imageView.image = UIImage(named: "ankara.jpeg")
            label.text = "Ankara"
        }


    }
    
    


}

