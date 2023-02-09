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
        
        updateUI()
        
    }
    
    func updateUI() {
        questionTextLabel.text = engine.currentQuestion?.qText
        questionNumberLabel.text = "Вопрос № \(String(engine.qNumber))"
        questionPriceLabel.text = "\(String(engine.score)) руб"
        
        answerOne.setTitle(engine.currentQuestion?.qAnswers[0] ?? "Some error", for: .normal)
        answerTwo.setTitle(engine.currentQuestion?.qAnswers[1] ?? "Some error", for: .normal)
        answerThree.setTitle(engine.currentQuestion?.qAnswers[2] ?? "Some error", for: .normal)
        answerFour.setTitle(engine.currentQuestion?.qAnswers[3] ?? "Some error", for: .normal)
        
        answerOne.setBackgroundImage(UIImage(named: "rectBlue"), for: .normal)
        answerTwo.setBackgroundImage(UIImage(named: "rectBlue"), for: .normal)
        answerThree.setBackgroundImage(UIImage(named: "rectBlue"), for: .normal)
        answerFour.setBackgroundImage(UIImage(named: "rectBlue"), for: .normal)
    }
    
    
    
    @IBAction func AnswerButton(_ sender: UIButton) {
        
        print("\(sender.currentTitle ?? "")")
        
        
        
        
        if engine.checkAnswer(answer: "\(sender.currentTitle ?? "")") {
            print("Ответили верно из вью")
            sender.setBackgroundImage(UIImage(named: "rectGreen"), for: .normal)
            let LadderViewController = self.storyboard?.instantiateViewController(withIdentifier: "LadderVC") as! LadderVC
            LadderViewController.qNumberToFlash = engine.qNumber - 1
            self.navigationController?.pushViewController(LadderViewController, animated: true)
            
            updateUI()
            
        } else {
            print("Ответили не верно. Переходим на экран проиграл")
            sender.setBackgroundImage(UIImage(named: "rectRed"), for: .normal)
        }
        
        
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
