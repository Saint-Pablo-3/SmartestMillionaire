//
//
//  SmartMillionaire
//
//  Created by Pavel Reshetov on 14.02.2023.
//

import Foundation

struct QuestionModel {

  // счет игры
  var score = "0"
  
  // номер вопроса
  var questionNumber = 0
  
  // массив из стркуктуры "Вопрос"
  let questions = [
      Question(summ: "100 рублей",
               question: "Чему не учат в школе в известной песне?",
               answers: ["A: Вычитать и умножать", "B: Буквы разные писать", "C: Малышей не обижать", "D: Нагоняи получать"],
               correctAnswer: "D: Нагоняи получать"),
      Question(summ: "200 рублей",
               question: "Что, согласно поговорке, происходит, когда идет караван?",
               answers: ["A: Собака лает", "B: Кошка мурлычет", "C: Ветер воет", "D: Море волнуется"],
               correctAnswer: "A: Собака лает"),
      Question(summ: "300 рублей",
               question: "Что обычно готовят способом пашот?",
               answers: ["A: Сыр", "B: Яйца", "C: Багет", "D: Ветчину"],
               correctAnswer: "B: Яйца"),
      Question(summ: "500 рублей",
               question: "Как зовут известную американскую певицу, автора хита «Bad Guy»?",
               answers: ["A: Бенни Айриш", "B: Питти Бейлиш", "C: Билли Айлиш", "D: Санни Бритиш"],
               correctAnswer: "C: Билли Айлиш"),
      Question(summ: "1000 рублей",
               question: "Реки с каким названием нет на территории России?",
               answers: ["A: Спина", "B: Уста", "C: Палец", "D: Шея"],
               correctAnswer: "A: Спина"),
      Question(summ: "2000 рублей",
               question: "Кто был первым военным министром Российской империи??",
               answers: ["A: Аракчеев", "B: Барклай-де-Толли", "C: Вязмитинов", "D: Коновницын"],
               correctAnswer: "C: Вязмитинов"),
      Question(summ: "4000 рублей",
               question: "Что Шекспир назвал «вкуснейшим из блюд в земном пиру»?",
               answers: ["A: Опьянение", "B: Любовь", "C: Уединение", "D: Сон"],
               correctAnswer: "D: Сон"),
      Question(summ: "8000 рублей",
               question: "Кто из этих философов в 1864 году написал музыку на стихи А. С. Пушкина «Заклинание» и «Зимний вечер»?",
               answers: ["A: Юнг", "B: Ницше", "C: Шопенгауэр", "D: Гегель"],
               correctAnswer: "B: Ницше"),
      Question(summ: "16000 рублей",
               question: "С какой фигуры начинаются соревнования по городошному спорту?",
               answers: ["A: Часовые", "B: Артиллерия", "C: Пушка", "D: Пулеметное гнездо"],
               correctAnswer: "C: Пушка"),
      Question(summ: "32000 рублей",
               question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
               answers: ["A: Один", "B: Два", "C: Три", "D: Четыре"],
               correctAnswer: "B: Два"),
      Question(summ: "64000 рублей",
               question: "Что Иван Ефремов в романе «Лезвие бритвы» назвал наивысшей степенью целесообразности?",
               answers: ["A: Красоту", "B: Мудрость", "C: Смерть", "D: Свободу"],
               correctAnswer: "A: Красоту"),
      Question(summ: "125000 рублей",
               question: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
               answers: ["A: Ереван", "B: Тбилиси", "C: Баку", "D: Минск"],
               correctAnswer: "B: Тбилиси"),
      Question(summ: "250000 рублей",
               question: "Сколько морей омывают Балканский полуостров?",
               answers: ["A: 3", "B: 4", "C: 5", "D: 6"],
               correctAnswer: "D: 6"),
      Question(summ: "500000 рублей",
               question: "Что в России 19 века делали в дортуаре?",
               answers: ["A: Ели", "B: Спали", "C: Купались", "D: Ездили верхом"],
               correctAnswer: "B: Спали"),
      Question(summ: "1000000 рублей",
               question: "Какой альпинист стал первым представителем СССР, покорившим Эверест?",
               answers: ["A: Анатолий Букреев", "B: Владимир Балыбердин", "C: Михаил Туркевич", "D: Эдуард Мысловский"],
               correctAnswer: "B: Владимир Балыбердин")
  ]
  
  // метод вопрос
  func getQuestionText() -> String {
      return questions[questionNumber].question
  }
  
  // метод ответ
  func getAnswers() -> [String] {
      return questions[questionNumber].answers.shuffled()
  }
    
  mutating func getScore() -> String {
      score = questions[questionNumber].summ
      return score
    }
  
  // подсчет денег
  func countOfSum() -> String {
    switch score {
       case "1000000 рублей": return "1000000 рублей"
       case "1000 рублей", "2000 рублей", "4000 рублей", "8000 рублей", "16000 рублей":
           return "1000 рублей"
       case "32000 рублей", "64000 рублей", "128000 рублей", "250000 рублей", "500000 рублей":
           return "32000 рублей"
       default: return "0 рублей"
    }
  }
  
  // счетчик вопросов
  mutating func nextQuestion() {
     if questionNumber + 1 < questions.count {
         questionNumber += 1
     } else {
         questionNumber = 0
     }
 }
  
  mutating func checkAnswer(userAnswer: String) -> Bool {
      //Need to change answer to rightAnswer here.
      if userAnswer == questions[questionNumber].correctAnswer {
          score = questions[questionNumber].summ
          
          return true
      } else {
          return false
      }
  }
  
}
