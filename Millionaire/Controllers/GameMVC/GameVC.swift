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
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engine.resetGame()
        engine.getStartQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        engine.player?.stop()
        updateUI()
        engine.playSound(soundName: engine.countdown!)
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
        sender.setBackgroundImage(UIImage(named: "rectPurple"), for: .normal)
        engine.playSound(soundName: engine.answerAccepted!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.engine.checkAnswer(answer: "\(sender.currentTitle ?? "")") {
                print("Ответили верно из вью")
                
                if self.engine.qNumber == 16 {
                    self.engine.playSound(soundName: self.engine.win!)
                    sender.setBackgroundImage(UIImage(named: "rectGreen"), for: .normal)
                    let ladderViewController = self.storyboard?.instantiateViewController(withIdentifier: "LadderVC") as! LadderVC
                    ladderViewController.qNumberToFlash = self.engine.qNumber - 1
                    self.navigationController?.pushViewController(ladderViewController, animated: true)
                } else {
                    self.engine.playSound(soundName: self.engine.rightAnswer!)
                    sender.setBackgroundImage(UIImage(named: "rectGreen"), for: .normal)
                    let ladderViewController = self.storyboard?.instantiateViewController(withIdentifier: "LadderVC") as! LadderVC
                    ladderViewController.qNumberToFlash = self.engine.qNumber - 1
                    self.navigationController?.pushViewController(ladderViewController, animated: true)
                }
                
                
                
                
            } else {
                print("Ответили не верно. Переходим на экран проиграл")
                self.engine.playSound(soundName: self.engine.wrongAnswer!)
                sender.setBackgroundImage(UIImage(named: "rectRed"), for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    let winOrLoseViewController = self.storyboard?.instantiateViewController(withIdentifier: "WinOrLoseViewController") as! WinOrLoseViewController
                    self.navigationController?.pushViewController(winOrLoseViewController, animated: true)
                }
            }
        }
        
        
    }
    
    @IBAction func takeMoney(_ sender: Any) {
        self.engine.playSound(soundName: self.engine.win!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let winOrLoseViewController = self.storyboard?.instantiateViewController(withIdentifier: "WinOrLoseViewController") as! WinOrLoseViewController
            self.navigationController?.pushViewController(winOrLoseViewController, animated: true)
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
