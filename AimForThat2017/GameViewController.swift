//
//  ViewController.swift
//  AimForThat2017
//
//  Created by Tecinco on 07-03-18.
//  Copyright © 2018 Fabian. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
        updateLabels()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        /*var difference : Int = 0
        
        if self.currentValue > self.targetValue {
            difference = self.currentValue - self.targetValue
        }else{
            difference  = self.targetValue - self.currentValue
        }
        */
        
        // el numero dentro de abs siempre sera positivo
        let difference : Int = abs(self.currentValue - self.targetValue)
        
        
        var points = 100 - difference
        
        
        let title: String
        switch difference {
        case 0:
            title = "¡¡¡Puntuación Perfecta!!!"
            points = Int(10.0 * Float(points))
        case 1...5:
            title = "Casi Perfecto ;)"
            points = Int(1.5 * Float(points))
        case 6...12:
            title = "Anda a laarte la cuea malo ql >:O"
            points = Int(1.2 * Float(points))
        default:
            title = "Malo ctm el peor"
        }
        
        let message = "Has marcado \(points) puntos"
        
        self.score += points
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Botón de la alerta
        
        let action = UIAlertAction(title: "Ok", style: .default ,
           handler: {
                action in
                self.startNweRound()
                self.updateLabels()
            })
        
        alert.addAction(action)
        present(alert, animated: true)
        
        
        
    }
    
    @IBAction func sliderMov(_ sender: UISlider) {
        self.currentValue = lroundf(sender.value)
        
    }
    func startNweRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.round += 1
    }
    
    func updateLabels(){
        self.targetLabel.text = "\(self.targetValue)"
        self.scoreLabel.text = "\(self.score)"
        self.roundLabel.text = "\(self.round)"
    }
    
    @IBAction func startNewGame() {
        resetGame()
        updateLabels()
    }
    
    func resetGame(){
        self.score = 0
        self.round = 0
        self.startNweRound()
    }
}

