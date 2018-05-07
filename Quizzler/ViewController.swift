//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions    = QuestionBank()
    var questionNumber  = 0
    var currentQuestion = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        var pickedAnswer = false

        if (sender.tag == 1) {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer(pickedAnswer : pickedAnswer)
        questionNumber += 1
        nextQuestion()
    }
    
    func checkAnswer(pickedAnswer : Bool) {
        let answer = allQuestions.list[questionNumber].answer
        
        if (pickedAnswer == answer) {
            print("Righto!")
        } else {
            print("Wrongo!")
        }
    }
    
    func nextQuestion() {
        if (questionNumber == (allQuestions.list.count - 1)) {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        currentQuestion    = allQuestions.list[questionNumber].questionText
        questionLabel.text = currentQuestion
    }
    
    func updateUI() {
        
    }
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    
}
