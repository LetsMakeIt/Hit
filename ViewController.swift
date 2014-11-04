//
//  ViewController.swift
//  HIt
//
//  Created by Tareyev Gregory on 29.10.14.
//  Copyright (c) 2014 TareyevProduction. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
        
    @IBOutlet weak var startCompetitionButton: UIButton!
    
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBOutlet weak var scoreInTotalLabel: UILabel!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var currentValue = 50;
    var targetValue = 0;
    var totalScore = 0;
    var rounds = 0;
    
    func startNewGame() {
        rounds = 0
        totalScore = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
            startNewGame()
            updateLabels()
    }
    
    @IBAction func showAlert() {
        
        let differents = abs(currentValue - targetValue)
        var points = 100 - differents
        
        
        let massage = "You scored: \(points) points"
        totalScore += points
        
        var title: String;
        if differents == 0 { title = "Perfect! Take this 100 point ovarall!"
            points += 100; }
        else if differents < 5 { title = "You almost had it!! (This 50 points for you)"
        points += 50 }
        else if differents < 10 { title = "Pretty good!" }
            
        else { title = "Not even close..." }
        
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                                                                                self.startNewRound()
                                                                                self.updateLabels()
                                                                            })
        
        alert.addAction(action)
        
        
        //Here we make the Alert visible
        presentViewController(alert, animated: true, completion: nil)
        
        /* Here we start the new round
        self.startNewRound()
        
        self.updateLabels() */
    }
    
        
    @IBAction func sliderMoved(slider: UISlider) {
        
        currentValue = lroundf(slider.value)
        
       /* TO VIEWDIDLOAD:
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")
            let trackRightResizable =
        trackRightImage.resizableImageWithCapInsets(insets); slider.setMaximumTrackImage(trackRightResizable, forState: .Normal) */
    }

    
    func startNewRound() {
        rounds += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreInTotalLabel.text = String(totalScore)
        roundsLabel.text = String(rounds)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewGame()
        
            
        
        self.updateLabels()
        // Do any additionaletup after loading the view, typically from a nib.
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

