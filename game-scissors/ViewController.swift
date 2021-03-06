//
//  ViewController.swift
//  game-scissors
//
//  Created by eric on 2020/11/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var gamePlayerLabel: UILabel!
    @IBOutlet weak var computerPlayerView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var computerloseLabel: UILabel!
    @IBOutlet weak var computerwinLabel: UILabel!
    @IBOutlet weak var peoplewinLabel: UILabel!
    @IBOutlet weak var peopleloseLabel: UILabel!
    let computer = ["rock","scissors","paper"]
    let game = ["👊","✌️","🖐"]
 
    var computerwin = 0
    var computerlose = 0
    var peoplewin = 0
    var peoplelose = 0
    
    func wincount(){
        peoplewin += 1
        computerlose += 1
        computerloseLabel.text = "\(computerlose)"
        peoplewinLabel.text = "\(peoplewin)"
    }
    
    
    func losecount(){
        peoplelose += 1
        computerwin += 1
        peopleloseLabel.text = "\(peoplelose)"
        computerwinLabel.text = "\(computerwin)"
    }
   
    func speek(){
        if computerPlayerView.image == UIImage(named: "rock"){
            let speechUtterance = AVSpeechUtterance(string: "石頭")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            speechUtterance.rate = 0.5
            speechUtterance.postUtteranceDelay = 50
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
     
        } else if computerPlayerView.image == UIImage(named: "scissors"){
            let speechUtterance = AVSpeechUtterance(string: "剪刀")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            speechUtterance.rate = 0.5
            speechUtterance.postUtteranceDelay = 50
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
        } else if computerPlayerView.image == UIImage(named: "paper"){
            let speechUtterance = AVSpeechUtterance(string: "布")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            speechUtterance.rate = 0.5
            speechUtterance.postUtteranceDelay = 50
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speechUtterance)
        }
        
        }
    
    
    
    @IBAction func rockBtn(_ sender: Any) {
  
     
        computerPlayerView.image = UIImage(named:computer.randomElement()!)
        speek()
        gamePlayerLabel.text = game[0]
        if gamePlayerLabel.text == game[0] , computerPlayerView.image == UIImage(named: "scissors") {
            resultLabel.text = "win"
            
          wincount()
            
        } else if gamePlayerLabel.text == game[0] , computerPlayerView.image == UIImage(named: "rock") {
            resultLabel.text = "平手"
        } else {
            resultLabel.text = "lose"
            
          losecount()
            
        }
    
    }
    
    
    @IBAction func scissorsBtn(_ sender: Any) {
      
        computerPlayerView.image = UIImage(named: computer.randomElement()!)
        speek()
        gamePlayerLabel.text = game[1]
        
        if gamePlayerLabel.text == game[1] , computerPlayerView.image == UIImage(named: "scissors") {
            resultLabel.text = "平手"
        } else if gamePlayerLabel.text == game[1] , computerPlayerView.image == UIImage(named: "rock") {
            resultLabel.text = "lose"
            
            losecount()
            
            
        } else {
            resultLabel.text = "win"
            
           wincount()
            
        }
        
    }
    
    @IBAction func paperBtn(_ sender: Any) {
     
        computerPlayerView.image = UIImage(named: computer.randomElement()!)
        speek()
        gamePlayerLabel.text = game[2]
        
        if gamePlayerLabel.text == game[2] , computerPlayerView.image == UIImage(named: "scissors") {
            resultLabel.text = "lose"
            
           losecount()
            
            
        } else if gamePlayerLabel.text == game[2] , computerPlayerView.image == UIImage(named: "rock") {
            resultLabel.text = "win"
            
           wincount()
            
        } else {
            resultLabel.text = "平手"
        }
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

