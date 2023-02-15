///
//  QuestionViewController.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    // background
    var backgroundImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "logo"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var currentBackgoundImageArray:[UIImage] = {
        var imageArray = [UIImage]()
        for _ in 1...15 {
            imageArray.append(UIImage(named: "waitingAnswerImage")!)
        }
        return imageArray
    }()
    
    var questionCounter = 0

    // question price buttons
    var buttonPrice1 = UIButton()
    var buttonPrice2 = UIButton()
    var buttonPrice3 = UIButton()
    var buttonPrice4 = UIButton()
    var buttonPrice5 = UIButton()
    var buttonPrice6 = UIButton()
    var buttonPrice7 = UIButton()
    var buttonPrice8 = UIButton()
    var buttonPrice9 = UIButton()
    var buttonPrice10 = UIButton()
    var buttonPrice11 = UIButton()
    var buttonPrice12 = UIButton()
    var buttonPrice13 = UIButton()
    var buttonPrice14 = UIButton()
    var buttonPrice15 = UIButton()
    
    
    // question number button
    var buttonQuestion1 = UIButton()
    var buttonQuestion2 = UIButton()
    var buttonQuestion3 = UIButton()
    var buttonQuestion4 = UIButton()
    var buttonQuestion5 = UIButton()
    var buttonQuestion6 = UIButton()
    var buttonQuestion7 = UIButton()
    var buttonQuestion8 = UIButton()
    var buttonQuestion9 = UIButton()
    var buttonQuestion10 = UIButton()
    var buttonQuestion11 = UIButton()
    var buttonQuestion12 = UIButton()
    var buttonQuestion13 = UIButton()
    var buttonQuestion14 = UIButton()
    var buttonQuestion15 = UIButton()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title: "Custom Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButtonItem
        backButtonItem.title = "К игре"
        setupViewsAndConstraint()
        questionCounter = UserDefaults.standard.integer(forKey: "questionCounter")
        setCurrentlabelImage()

    }
    
    @objc func backButtonTapped() {
        let gameVC = GameViewController()
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func setCurrentlabelImage(){
        
        for (index, element) in [buttonQuestion1, buttonQuestion2, buttonQuestion3, buttonQuestion4, buttonQuestion5, buttonQuestion6, buttonQuestion7, buttonQuestion8, buttonQuestion9, buttonQuestion10, buttonQuestion11, buttonQuestion12, buttonQuestion13, buttonQuestion14, buttonQuestion15].enumerated() {
            if index == questionCounter {
                element.setBackgroundImage(UIImage(named: "waitingAnswerImage"), for: .normal)
                
            }
        }
        
        for (index, element) in [buttonPrice1, buttonPrice2, buttonPrice3, buttonPrice4, buttonPrice5, buttonPrice6, buttonPrice7, buttonPrice8, buttonPrice9, buttonPrice10, buttonPrice11, buttonPrice12, buttonPrice13, buttonPrice14, buttonPrice15].enumerated() {
            if index == questionCounter {
                element.setBackgroundImage(UIImage(named: "waitingAnswerImage"), for: .normal)
                
            }
        }
        
        questionCounter += 1
        UserDefaults.standard.set(questionCounter, forKey: "questionCounter")
        
    }
    
}

    extension QuestionViewController {
        
        func questionStackview(_ button1: UIButton, _ button2: UIButton) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: [button1, button2])
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = -30
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }
        
        func setupViewsAndConstraint() {
            
            for button in [buttonPrice1, buttonPrice2, buttonPrice3, buttonPrice4, buttonPrice5, buttonPrice6, buttonPrice7, buttonPrice8, buttonPrice9, buttonPrice10, buttonPrice11, buttonPrice12, buttonPrice13, buttonPrice14, buttonPrice15] {
                
                button.setBackgroundImage(UIImage(named: "questionSumNumberView"), for: .normal)
                button.setBackgroundImage(UIImage(named: "questionSumNumberView"), for: .highlighted)
                button.titleLabel?.font = .systemFont(ofSize: 16)
                button.contentHorizontalAlignment = .right
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
                button.translatesAutoresizingMaskIntoConstraints = false
                
            }
            
            for button in [buttonQuestion1, buttonQuestion2, buttonQuestion3, buttonQuestion4, buttonQuestion5, buttonQuestion6, buttonQuestion7, buttonQuestion8, buttonQuestion9, buttonQuestion10, buttonQuestion11, buttonQuestion12, buttonQuestion13, buttonQuestion14, buttonQuestion15] {
                
                button.setBackgroundImage(UIImage(named: "questionSumNumberView"), for: .normal)
                button.setBackgroundImage(UIImage(named: "questionSumNumberView"), for: .highlighted)
                button.titleLabel?.font = .systemFont(ofSize: 16)
                button.contentHorizontalAlignment = .left
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
                button.translatesAutoresizingMaskIntoConstraints = false
            }
            
            buttonPrice15.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonPrice15.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            buttonQuestion15.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonQuestion15.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            
            buttonPrice10.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonPrice10.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            buttonQuestion10.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonQuestion10.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            
            buttonPrice5.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonPrice5.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            buttonQuestion5.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .normal)
            buttonQuestion5.setBackgroundImage(UIImage(named: "questionSafeSumView"), for: .highlighted)
            
            buttonPrice1.setTitle("100 RUB", for: .normal)
            buttonPrice2.setTitle("200 RUB", for: .normal)
            buttonPrice3.setTitle("300 RUB", for: .normal)
            buttonPrice4.setTitle("500 RUB", for: .normal)
            buttonPrice5.setTitle("1000 RUB", for: .normal)
            buttonPrice6.setTitle("2000 RUB", for: .normal)
            buttonPrice7.setTitle("4000 RUB", for: .normal)
            buttonPrice8.setTitle("8000 RUB", for: .normal)
            buttonPrice9.setTitle("16000 RUB", for: .normal)
            buttonPrice10.setTitle("32000 RUB", for: .normal)
            buttonPrice11.setTitle("64000 RUB", for: .normal)
            buttonPrice12.setTitle("125000 RUB", for: .normal)
            buttonPrice13.setTitle("250000 RUB", for: .normal)
            buttonPrice14.setTitle("5000000 RUB", for: .normal)
            buttonPrice15.setTitle("1.000.000 RUB", for: .normal)
            
            buttonQuestion1.setTitle("Вопрос 1", for: .normal)
            buttonQuestion2.setTitle("Вопрос 2", for: .normal)
            buttonQuestion3.setTitle("Вопрос 3", for: .normal)
            buttonQuestion4.setTitle("Вопрос 4", for: .normal)
            buttonQuestion5.setTitle("Вопрос 5", for: .normal)
            buttonQuestion6.setTitle("Вопрос 6", for: .normal)
            buttonQuestion7.setTitle("Вопрос 7", for: .normal)
            buttonQuestion8.setTitle("Вопрос 8", for: .normal)
            buttonQuestion9.setTitle("Вопрос 9", for: .normal)
            buttonQuestion10.setTitle("Вопрос 10", for: .normal)
            buttonQuestion11.setTitle("Вопрос 11", for: .normal)
            buttonQuestion12.setTitle("Вопрос 12", for: .normal)
            buttonQuestion13.setTitle("Вопрос 13", for: .normal)
            buttonQuestion14.setTitle("Вопрос 14", for: .normal)
            buttonQuestion15.setTitle("Вопрос 15", for: .normal)
            
            
            let stack1 = questionStackview(buttonQuestion1, buttonPrice1)
            let stack2 = questionStackview(buttonQuestion2, buttonPrice2)
            let stack3 = questionStackview(buttonQuestion3, buttonPrice3)
            let stack4 = questionStackview(buttonQuestion4, buttonPrice4)
            let stack5 = questionStackview(buttonQuestion5, buttonPrice5)
            let stack6 = questionStackview(buttonQuestion6, buttonPrice6)
            let stack7 = questionStackview(buttonQuestion7, buttonPrice7)
            let stack8 = questionStackview(buttonQuestion8, buttonPrice8)
            let stack9 = questionStackview(buttonQuestion9, buttonPrice9)
            let stack10 = questionStackview(buttonQuestion10, buttonPrice10)
            let stack11 = questionStackview(buttonQuestion11, buttonPrice11)
            let stack12 = questionStackview(buttonQuestion12, buttonPrice12)
            let stack13 = questionStackview(buttonQuestion13, buttonPrice13)
            let stack14 = questionStackview(buttonQuestion14, buttonPrice14)
            let stack15 = questionStackview(buttonQuestion15, buttonPrice15)
            
            let mainStackView = UIStackView(arrangedSubviews: [stack15, stack14, stack13, stack12, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1])
            mainStackView.axis = .vertical
            mainStackView.spacing = 5
            mainStackView.alignment = .fill
            mainStackView.distribution = .fillEqually
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(backgroundImageView)
            view.addSubview(logoButton)
            view.addSubview(mainStackView)
            
            NSLayoutConstraint.activate ([
                
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                logoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoButton.heightAnchor.constraint(equalToConstant: 100),
                logoButton.widthAnchor.constraint(equalToConstant: 100),
                
                mainStackView.topAnchor.constraint(equalTo: logoButton.bottomAnchor, constant: 16),
                mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
        
    }
}
