//
//  Question.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

struct Question {
    let summ: String
    
    let question: String
    
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answers: [String]
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let correctAnswer: String
    
    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(summ: String, question: String, answers: [String], correctAnswer: String) {
        self.summ = summ
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
