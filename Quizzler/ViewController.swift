//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = (sender.tag == 1) ? true : false
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber+1)
        print(progressBar.frame.size.width)
    }
    

    func nextQuestion() {
        if(questionNumber < allQuestions.list.count) {
            questionLabel.text = allQuestions.list[questionNumber].text
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "End of quiz. Start over?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        if(pickedAnswer == allQuestions.list[questionNumber].correctAnswer) {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
        updateUI()
    }
    

    
}
