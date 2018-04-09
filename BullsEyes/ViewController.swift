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
    var valueChanged:Int = 0
    
    
    //To save a Slider Value .. outlet connected
    @IBOutlet weak var slider:UISlider!
    var targerValue:Int = 0
    
    @IBOutlet weak var targetValLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueChanged = lroundf(slider.value)
        startNewRound()
}
    
    func updatedLables()  {
        targetValLabel.text = String(targerValue)
    }
    
    func startNewRound() {
        targerValue =  1 + Int(arc4random_uniform(100))
        valueChanged = 50
        slider.value = Float(valueChanged)
        updatedLables()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //slider is the name of parameter ; it specified when it call a method
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        print("Value of the slider is now : \(slider.value)")
        
        valueChanged = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        
        let message = "the value of the slider was : \(valueChanged)" + "\nThe Target Value is:\(targerValue) "
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    


}

