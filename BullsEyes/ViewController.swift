//
//  ViewController.swift
//  BullsEyes
//
//  Created by Karan Sagar on 06/04/18.
//  Copyright © 2018 Karan Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //this is connected to slider
    var currentValue = 0
    
    
    //To save a Slider Value .. outlet connected
    @IBOutlet weak var slider:UISlider!
    var targetValue = 0
    
    //this is the lable outlet for the random number between 0 to 100
    @IBOutlet weak var targetValLabel: UILabel!
    
    //Save User's score
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = lroundf(slider.value)
        startNewRound()
}
    
    //Update the numbers of the outlets on viewDidLoad or Hit Button Pressed
    func updatedLables()  {
        targetValLabel.text = String(targetValue)
    }
    
    func startNewRound() {
        targetValue =  1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
        // Added func on Func
        updatedLables()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //slider is the name of parameter ; it specified when it call a method
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        print("Value of the slider is now : \(slider.value)")
        
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        
//        var difference:Int = currentValue - targetValue
//        if difference < 0 {
//            difference = difference * -1
//        }
        //----// Another Way //----//
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
    
        let message = "You Scored \(points) points"
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    


}

