
//
//  GamrControllerLogic.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import Foundation
import UIKit
import AVFoundation
extension GameViewController { // вынес логику действий в игре в отдельный файл
    
    func answerButtonAction() {
        for button in [answerButtonA, answerButtonB, answerButtonC, answerButtonD] {
            button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        // музыка ожидания
        guard let url = Bundle.main.url(forResource: "fiveSecWaitAnswerSound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print ("sound error")
        }
        player.play()
        
        
        timerLabel.text = "Ответ принят"
        
        // ставим кнопкам ответы
        guard let userAnswer = sender.currentTitle else { return print("answersMistake") }
//
        for button in [answerButtonA, answerButtonB, answerButtonC, answerButtonD, stopLogoButton, hallHelpButton, fiftyFiftyButton, callToFriendButton] {
            button.isEnabled = false
        }
        
        // проверяем ответ, то меняем фон кнопки на соотвествующий
        let userGotItRight = questionModel.checkAnswer(userAnswer: userAnswer)
        if userGotItRight {
            
            sender.setBackgroundImage(UIImage(named: "waitingAnswerImage"), for: .normal)
            prizeAmount = questionModel.countOfSum()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                sender.setBackgroundImage(UIImage(named: "correctAnswerImage"), for: .normal)
            }
            
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateCorrectAnswer), userInfo: nil, repeats: false)
            
            Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(goToQuestionVC), userInfo: nil, repeats: false)
            
            
        } else {
            
            sender.setBackgroundImage(UIImage(named: "waitingAnswerImage"), for: .normal)
            prizeAmount = questionModel.countOfSum()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                sender.setBackgroundImage(UIImage(named: "incorrectAnswerImage"), for: .normal)
            }
            // таймер при нажатии кнопки неверного ответа
            Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(gameOver), userInfo: nil, repeats: false)
        }
     
    }
    
    
    // логика смены фона кнопки верного ответа
    @objc func updateCorrectAnswer() {
        
        //загрузка след вопросов
        questionModel.nextQuestion()
        //звук
        guard let url = Bundle.main.url(forResource: "correctEasyAnswerSound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print ("sound error")
        }
        // затем снова главная музыка
        player.play()
    }
    
    
    // логика смены вопроса на экране
    @objc func updateUI() {
        for button in [answerButtonA, answerButtonB, answerButtonC, answerButtonD, stopLogoButton, hallHelpButton, fiftyFiftyButton, callToFriendButton] {
            button.isEnabled = true
        }

        timer.invalidate() //стопим таймер
        totalTime = 30 //обнуляем время
        timerLabel.text = "30"
        secondPassed = 0
        playTimeSound()
        roundTimer()

        // след вопрос на экране
        questionLabel.text = questionModel.getQuestionText()
        let answerChoices = questionModel.getAnswers()
        let numberOfQuestion = questionModel.questionNumber
        UserDefaults.standard.set(numberOfQuestion, forKey: "questionNumber")
        
        answerButtonA.setTitle(answerChoices[0], for: .normal)
        answerButtonB.setTitle(answerChoices[1], for: .normal)
        answerButtonC.setTitle(answerChoices[2], for: .normal)
        answerButtonD.setTitle(answerChoices[3], for: .normal)
        questionSummLabel.text = questionModel.getScore()
        answerButtonSetup()
        questionNumberLabel.text = "Вопрос \(questionModel.questionNumber + 1)"
        

    }
    
    // неверный ответ - музыка
    @objc func gameOver() {
        
        if let domain = Bundle.main.bundleIdentifier { // сброc UserDefaults
            UserDefaults.standard.removePersistentDomain(forName: domain) // сброc
        }
        
        // музыка неверного ответа
            guard let url = Bundle.main.url(forResource: "incorrectAnswerSound", withExtension: "mp3") else { return }
            do {
                player = try AVAudioPlayer(contentsOf: url)
            } catch {
                print ("sound error")
            }
            player.play()
        
        // переход на экран результата
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.stopSound()
            self.goToResultVC()
        }
    }
    // переход на Question VC
    @objc func goToQuestionVC() {
        updateUI()
        stopTimer()
        stopSound()
        let resultVC = QuestionViewController()
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // остановка музыки
    func stopSound() {
        player.stop()
    }
    
    // остановка таймера
    func stopTimer() {
        timer.invalidate()
    }
    
    func goToResultVC() {
        let resultVC = ResultViewController()
        resultVC.resultOfTheGame = prizeAmount
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
}

