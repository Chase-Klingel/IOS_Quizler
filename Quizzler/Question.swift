//
//  Question.swift
//  Quizzler
//
//  Created by Chase Klingel on 5/5/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    // properties
    let questionText : String
    let answer       : Bool
    
    // event
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer       = correctAnswer
    }
    
    
}
