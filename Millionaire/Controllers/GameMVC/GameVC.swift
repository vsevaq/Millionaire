//
//  GameVC.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 6.02.23.
//

import UIKit

class GameVC: UIViewController {
    
    var engine = GameEngine()

    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionPriceLabel: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engine.resetGame()
        engine.getStartQuestion()
        
        questionTextLabel.text = engine.currentQuestion?.qText
        questionNumberLabel.text = "Вопрос № \(String(engine.qNumber))"
        questionPriceLabel.text = "\(String(engine.score)) руб"
        
        answerOne.setTitle(engine.currentQuestion?.qAnswers[0] ?? "Some error", for: .normal)
        answerTwo.setTitle(engine.currentQuestion?.qAnswers[1] ?? "Some error", for: .normal)
        answerThree.setTitle(engine.currentQuestion?.qAnswers[2] ?? "Some error", for: .normal)
        answerFour.setTitle(engine.currentQuestion?.qAnswers[3] ?? "Some error", for: .normal)
        
    }
    

    
    @IBAction func AnswerOneButton(_ sender: UIButton) {
        print("Нажали Ответ 1")
    }
    
    @IBAction func AnswerTwoButton(_ sender: UIButton) {
        print("Нажали Ответ 2")
    }
    
    @IBAction func AnswerThreeButton(_ sender: UIButton) {
        print("Нажали Ответ 3")
    }
    
    @IBAction func AnswerFourButton(_ sender: UIButton) {
        print("Нажали Ответ 4")
    }
    
    @IBAction func FiftyFiftyButton(_ sender: UIButton) {
        print("Нажали 50:50")
    }
    
    @IBAction func PeopleHelpButton(_ sender: UIButton) {
        print("Нажали помощь зала")
    }
    
    @IBAction func CallToFriendButton(_ sender: UIButton) {
        print("Нажали звонок другу")
    }
    
    
}
