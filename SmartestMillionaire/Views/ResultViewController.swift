//
//  resultViewController.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import Foundation
import UIKit
import AVFoundation

class ResultViewController: UIViewController {

    var resultOfTheGame = ""

    var player = AVAudioPlayer()
    var questionModel = QuestionModel()
    
    let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoView: UIImageView = {
        let logoImage = UIImageView ()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.font = UIFont.boldSystemFont(ofSize: 40)
        resultLabel.textColor = UIColor.white
        resultLabel.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.minimumScaleFactor = 0.7
        resultLabel.text = "Вы выиграли"
        resultLabel.layer.shadowRadius = 3.0
        resultLabel.layer.shadowOpacity = 1.0
        resultLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
    var sumLabel: UILabel = {
        var sumLabel = UILabel()
        sumLabel.font = UIFont.boldSystemFont(ofSize: 60)
        sumLabel.textColor = #colorLiteral(red: 0.9098039216, green: 0.8196078431, blue: 0.5137254902, alpha: 1)
        sumLabel.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        sumLabel.layer.shadowRadius = 3.0
        sumLabel.layer.shadowOpacity = 1.0
        sumLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        sumLabel.textAlignment = .center
        sumLabel.numberOfLines = 0
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        return sumLabel
    }()
    
    
    let buttonPlayyAgain: UIButton = {
        let buttonPlayAgain = UIButton()
        buttonPlayAgain.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        buttonPlayAgain.layer.cornerRadius = 15
        buttonPlayAgain.layer.borderColor = #colorLiteral(red: 0.737254902, green: 0.6235294118, blue: 0.9215686275, alpha: 1)
        buttonPlayAgain.layer.borderWidth = 5
        buttonPlayAgain.setTitle("Начать заново", for: .normal)
        buttonPlayAgain.setTitleColor(UIColor.white, for: .normal)
        buttonPlayAgain.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        buttonPlayAgain.addTarget(self, action: #selector(playAgainPressed), for: .touchUpInside)
        buttonPlayAgain.translatesAutoresizingMaskIntoConstraints = false
        return buttonPlayAgain
    }()
    
    lazy var buttonExit: UIButton = {
        let buttonExit = UIButton()
        buttonExit.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        buttonExit.layer.cornerRadius = 15
        buttonExit.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.8196078431, blue: 0.5137254902, alpha: 1)
        buttonExit.layer.borderWidth = 5
        buttonExit.setTitle("Выход", for: .normal)
        buttonExit.setTitleColor(UIColor.white, for: .normal)
        buttonExit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        buttonExit.addTarget(self, action: #selector(buttonExitPressed), for: .touchUpInside)
        buttonExit.translatesAutoresizingMaskIntoConstraints = false
        return buttonExit
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumLabel.text = resultOfTheGame
        playEndSound()
        view.addSubview(backgroundView)
        setupView()
        setupConstaints()
        self.navigationItem.hidesBackButton = true // скрытие кнопки назад, добавил Павел
        
        if let data = Bundle.main.bundleIdentifier { // сброc UserDefaults
            UserDefaults.standard.removePersistentDomain(forName: data) // сброc UserDefaults
        }
    }

        func setupView() {
            view.addSubview(logoView)
            view.addSubview(resultLabel)
            view.addSubview(buttonPlayyAgain)
            view.addSubview(buttonExit)
            view.addSubview(sumLabel)
        }

    
    @objc func playAgainPressed() {
        let gameStartVC = GameViewController()
        self.navigationController?.pushViewController(gameStartVC, animated: true)
        player.stop()
    }
    
    @objc func buttonExitPressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func playEndSound() {
        guard let url = Bundle.main.url(forResource: "gameOverSound", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)

        } catch {
            print ("sound error")
        }
  
        player.play()
        
            }

    func stopPlay(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
    }
    

    func setupConstaints() {
        NSLayoutConstraint.activate ([
            
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            sumLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            sumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonPlayyAgain.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 60),
            buttonPlayyAgain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonPlayyAgain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonPlayyAgain.heightAnchor.constraint(equalToConstant: 60),

            buttonExit.topAnchor.constraint(equalTo: buttonPlayyAgain.bottomAnchor, constant: 20),
            buttonExit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonExit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonExit.heightAnchor.constraint(equalToConstant: 60),
            
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

