//
//  Question.swift
//  Quizzler
//
//  Created by Louis Menacho on 2/9/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let text: String
    let correctAnswer: Bool
    
    init(text:String, correctAnswer:Bool) {
        self.text = text
        self.correctAnswer = correctAnswer
    }
    
}
