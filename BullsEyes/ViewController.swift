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
    //Show user Score Outletcongiguration
    @IBOutlet weak var scoreLabel:UILabel!
    
    //Keep track of Rounds
    var rounds = 0
    @IBOutlet weak var roundLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = lroundf(slider.value)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") // UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackImageLeft = #imageLiteral(resourceName: "SliderTrackLeft") // UIImage(named: "SliderTrackLeft")
        let trackLeftResizeable = trackImageLeft.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackImageRight = #imageLiteral(resourceName: "SliderTrackRight")  // UIImage(named: "SliderTrackRight")
        let trackRightResizeable = trackImageRight.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
        
        // Style with HTML but will skip for now
        /*
         
        if let url = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let htmlUrl = URL(fileURLWithPath: url)
            let req = URLRequest(url: htmlUrl)
            webView.load(req)
        }
        */
        
}
    
    //Start new round
    @IBAction func startNewGame()  {
        score = 0
        rounds = 0
        startNewRound()
    }
    
    
    //Update the numbers of the outlets on viewDidLoad or Hit Button Pressed
    func updatedLables()  {
        targetValLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
        
    }
    
    func startNewRound() {
        
        rounds += 1
        
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
        var points = 100 - difference
        
        
        
        scoreLabel.text = String(score)
        
        
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
        
        let title:String
        if difference == 0 {
            title = "Perfect !"
            points += 100
        } else if difference < 5 {
            title = "You had it!\(Int(slider.value))"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "you did pretty good !"
        } else {
            title = "Whatever Huh ! : \(Int(slider.value))"
        }
        
        //save Score
        score += points // score = score + points
        
        
        let message = "You Scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //
    


}

