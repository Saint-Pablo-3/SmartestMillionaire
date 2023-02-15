//
//  ViewController.swift
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.isDirectionalLockEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = #colorLiteral(red: 0.9098039216, green: 0.8196078431, blue: 0.5137254902, alpha: 1)
        label.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rulesContent: UILabel = {
        let rules = UILabel()
        rules.text = "   Игра Кто хочет стать миллионером? - это конкурс викторина, в котором участники должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень. Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, участники не имеют никаких временных ограничений для предоставления ответа. Участники также получают три вида подсказок, чтобы помочь себе, если они застряли на конкретном вопросе.\n\n    Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит три вопроса.\n\n   Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность. Например: вопросы 1-3 составляют первый уровень и будут содержать самые простые вопросы. Второй уровень (вопросы 4–6) будет несколько сложнее, за ним следует третий уровень (вопросы 7–9). Четвертый уровень (вопросы 10–12) будет состоять из действительно сложных вопросов, за которыми следует пятый и последний уровень (вопросы 13–15), имеющий самые сложные вопросы в игре.\n\n   Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.\n\n   Вопрос 1 - 100 руб.\n\n   Вопрос 2 - 200 руб.\n\n   Вопрос 3 - 300 руб.\n\n   Вопрос 4 - 500 руб.\n\n   Вопрос 5 - 1000 руб. Несгораемая сумма.\n\n   Если участники неправильно отвечают на последний вопрос вопрос, то они уходят ни с чем. Если на этот вопрос дан правильный ответ, участникам гарантируется 1000 рублей, даже если дадут неверный ответ до достижения следующей несгораемой суммы в десятом вопросе.\n\n   Подсказки\n\n   Участникам разрешается применить три подсказки, которые они могут использовать в любой момент викторины. Каждая из подсказок может быть использована только один раз.\n\n   50/50 - исключает два неправильных ответа из множественного выбора, оставляя участнику только один правильный и один неправильный вариант. Это означает, что у него есть шанс 50/50.\n\n   Задать вопрос аудитории - залу задают тот же вопрос, что и участнику, и проводится быстрый опрос, чтобы показать их ответы. На диаграмме показывается явное преимущество определенного варианта, эта подсказка может быть чрезвычайно полезной. Участнику дается возможность согласиться с результатами, полученными от аудитории.\n\n   Позвоните другу - участникам разрешается сделать 30-секундный звонок другу или члену семьи и спросить, знают ли они ответ на вопрос."
        rules.translatesAutoresizingMaskIntoConstraints = false
        rules.font = UIFont.systemFont(ofSize: 24)
        rules.textColor = UIColor.white
        rules.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2980392157, alpha: 1)
        rules.layer.shadowRadius = 3.0
        rules.layer.shadowOpacity = 1.0
        rules.layer.shadowOffset = CGSize(width: 4, height: 4)
        rules.lineBreakMode = .byWordWrapping
        rules.numberOfLines = 0
        return rules
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        view.addSubview(backgroundView)
        view.addSubview(scrollView)
        scrollView.addSubview(rulesContent)
        view.addSubview(rulesLabel)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            rulesContent.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            rulesContent.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            rulesContent.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            rulesContent.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            rulesContent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                   
            rulesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            rulesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            rulesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            rulesLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
                
        ])
    }
    
}


