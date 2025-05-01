//
//  ViewController.swift
//  Project2
//
//  Created by Koray Urun on 30.04.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentNumberOfQuestion = 0
    var totalNumberOfQuestion = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")*/
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        //button2.layer.borderColor = UIColor(red:1.0, green:0.8, blue:0.8, alpha:1).cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor


        
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named:countries[0]),for: .normal)
        button2.setImage(UIImage(named:countries[1]),for: .normal)
        button3.setImage(UIImage(named:countries[2]),for: .normal)
        
        title = "Find " + countries[correctAnswer].uppercased() + " (Your score \(score))"

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        currentNumberOfQuestion+=1

        var title : String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score+=1
        }else{
            title = "Wrong"
            score-=1
        }
        
        
        if currentNumberOfQuestion >= totalNumberOfQuestion{
            let finalAlert = UIAlertController(title: "Game Over", message: "Your final score is \(score) out of \(totalNumberOfQuestion) questions.", preferredStyle: .alert)
            
            finalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil)) // Handler nil olduğu için alert kapanır
            
            present(finalAlert, animated: true)

        }
        
        else{
            if title == "Correct"{
                let ac = UIAlertController(title: title, message: "Your score is \(score)\n Question \(currentNumberOfQuestion)/10", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            }
            else {
                let ac = UIAlertController(title: title, message: "Your score is \(score)\n Question \(currentNumberOfQuestion)/10\n This one is \(countries[sender.tag].uppercased()) not \(countries[correctAnswer].uppercased())", preferredStyle: .alert)
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            }
            
            
            }
        
        
        
        
    }
        
        

}

