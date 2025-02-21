//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil,repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = "\(quizBrain.getQuestionNumber()). " + quizBrain.getQuestion()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress =  quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    @IBAction func aboutPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Developer", message: "Name: Thewa Laokasikan\nID: 6614110014", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

