
//
//  AnswerButtonLogic.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import Foundation
import UIKit

extension GameViewController {
    
    //MARK: - 50:50
    
    func fiftyFiftyLogic() {
        fiftyFiftyButton.addTarget(self, action: #selector(fiftyFiftyAction), for: .touchUpInside)
    }
    
    @objc func fiftyFiftyAction() {
        
        let alertController = UIAlertController(title: "Подсказка 50:50", message: "Вы хотите взять подсказку?", preferredStyle: .alert)
        
        // переход на экран результата игры
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.removeHalfAnswers()
            
            self.fiftyFiftyButton.isEnabled = false
            self.fiftyFiftyButton.setBackgroundImage(UIImage(named: "fiftyFiftyNotAvailable"), for: .normal)
            
            let taken5050Hint = true  // в отд. метод подсказок
            UserDefaults.standard.set(taken5050Hint, forKey: "fiftyHint") // в отд. метод подсказок
        }
        // отмена выхода
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true) {
        }
    }
    
    func removeHalfAnswers() {
        let answerButtonArray = [answerButtonA, answerButtonB, answerButtonC, answerButtonD]
        
        var counter = 0
        var previouslyNumber = -1
        
        while counter != 2 {
            let number = Int.random(in: 0...3)
            let userAnswer = answerButtonArray[number].titleLabel?.text
            
            guard
                number != previouslyNumber,
                questionModel.checkAnswer(userAnswer: userAnswer ?? "") == false
            else { continue }
            
            answerButtonCofigure(by: number)
            previouslyNumber = number
            counter += 1
        }
    }
    
    func answerButtonCofigure(by index: Int) {
        let answerButtonArray = [answerButtonA, answerButtonB, answerButtonC, answerButtonD]
        answerButtonArray[index].setTitle("", for: .normal)
    }
    
    
    //MARK: - помощь зала
    func hallHelpLogic() {
        hallHelpButton.addTarget(self, action: #selector(hallHelpAction), for: .touchUpInside)
    }
    
    @objc func hallHelpAction() {
        let alertController = UIAlertController(title: "Подсказка Помощь Зала", message: "Вы хотите взять подсказку?", preferredStyle: .alert)
        
        // переход на экран результата игры
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.hallHelpAnswers()
            
            self.hallHelpButton.isEnabled = false
            self.hallHelpButton.setBackgroundImage(UIImage(named: "hallHelpNotAvailable"), for: .normal)
            
            let takenHallHint = true  // в отд. метод подсказок
            UserDefaults.standard.set(takenHallHint, forKey: "hallHint") // в отд. метод подсказок
        }
        // отмена выхода
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true) {
        }
        
    }
    
    func hallHelpAnswers() {
        
        // массив не пустых кнопок ответа
        var notEmptyButton = [UIButton]()
        // массив неверных ответов
        var onlyIncorrectAnswers = [UIButton]()
        // массив все кнопок
        let answerButtonArray = [answerButtonA, answerButtonB, answerButtonC, answerButtonD]
     
        // оставляем массив только из неверных и не убранных ответов
        for button in answerButtonArray  {
            if  button.currentTitle != "" {
                notEmptyButton.append(button)
            }
        }
        
        for button in notEmptyButton {
            if  questionModel.checkAnswer(userAnswer: button.currentTitle!) == false {
                onlyIncorrectAnswers.append(button)
            }
        }
        
        var correctAnswer = Bool()
        var answerTitle = ""
        let randomNumber = Int.random(in: 1...100)
        switch randomNumber {
        case 0...70: //
            correctAnswer = true
            print("true")
        default:
            correctAnswer = false
            print("false")
        }
        
        for button in notEmptyButton {
            if questionModel.checkAnswer(userAnswer: button.currentTitle!) && correctAnswer {
                answerTitle = button.currentTitle!
            } else {
                if correctAnswer == false {
                    answerTitle = onlyIncorrectAnswers.randomElement()?.currentTitle ?? "Error of title"
                    
                }
            }
        }
        
        let alert = UIAlertController(title: "Вот как ответило большинство:", message: answerTitle, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - звоноу другу
    func friendCallLogic() {
        callToFriendButton.addTarget(self, action: #selector(callFriendAction), for: .touchUpInside)
    }
    
    @objc func callFriendAction() {
        
        let alertController = UIAlertController(title: "Подсказка Звонок Другу", message: "Вы хотите взять подсказку?", preferredStyle: .alert)
        
        // переход на экран результата игры
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.friendHelpAnswer()
            
            self.callToFriendButton.isEnabled = false
            self.callToFriendButton.setBackgroundImage(UIImage(named: "callFriendNotAvailable"), for: .normal)
            
            let friendCallHint = true  // в отд. метод подсказок
            UserDefaults.standard.set(friendCallHint, forKey: "callHint") // в отд. метод подсказок
        }
        // отмена выхода
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true) {
        }
        
    }
    
    func friendHelpAnswer() {
            
            // массив не пустых кнопок ответа
            var notEmptyButton = [UIButton]()
            // массив неверных ответов
            var onlyIncorrectAnswers = [UIButton]()
            // массив все кнопок
            let answerButtonArray = [answerButtonA, answerButtonB, answerButtonC, answerButtonD]
            
            for button in answerButtonArray  {
                if  button.currentTitle != "" {
                    notEmptyButton.append(button)
                }
            }
            
            for button in notEmptyButton {
                if  questionModel.checkAnswer(userAnswer: button.currentTitle!) == false {
                    onlyIncorrectAnswers.append(button)
                }
            }
            
            var correctAnswer = Bool()
            var answerTitle = ""
            let randomNumber = Int.random(in: 1...100)
            switch randomNumber {
            case 0...80: //
                correctAnswer = true
                print("true")
            default:
                correctAnswer = false
                print("false")
            }
            
            for button in notEmptyButton {
                if questionModel.checkAnswer(userAnswer: button.currentTitle!) && correctAnswer {
                    answerTitle = button.currentTitle!
                } else {
                    if correctAnswer == false {
                        answerTitle = onlyIncorrectAnswers.randomElement()?.currentTitle ?? "Error of title"
                        
                    }
                }
            }
            
            let alert = UIAlertController(title: "👋 Не уверен точно, но думаю 🤔 это", message: answerTitle, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    func hintButtonsShow() {
        
        if UserDefaults.standard.bool(forKey: "fiftyHint") {
            fiftyFiftyButton.isEnabled = false
            fiftyFiftyButton.setBackgroundImage(UIImage(named: "fiftyFiftyNotAvailable"), for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "hallHint") {
            hallHelpButton.isEnabled = false
            hallHelpButton.setBackgroundImage(UIImage(named: "hallHelpNotAvailable"), for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "callHint") {
            callToFriendButton.isEnabled = false
            callToFriendButton.setBackgroundImage(UIImage(named: "callFriendNotAvailable"), for: .normal)
        }
        
        
    }
    
        
    
}
