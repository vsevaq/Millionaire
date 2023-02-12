import UIKit

protocol CounterDelegate: AnyObject {
    func updateCounter(counter: Int)
}

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
        self.navigationItem.hidesBackButton = true
        engine.counterDelegate = self
        engine.resetGame()
        engine.getStartQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        engine.stopSound()
        engine.stopTimer()
        timerLabel.text = "30"
        updateUI()
        engine.playSound(soundName: engine.countdown!)
        engine.startTimer()
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
        engine.stopTimer()
        sender.setBackgroundImage(UIImage(named: "rectPurple"), for: .normal)
        engine.playSound(soundName: engine.answerAccepted!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.engine.checkAnswer(answer: "\(sender.currentTitle ?? "")") {
                self.engine.winMoney = questionMoney[self.engine.qNumber - 1]!
                
                if self.engine.qNumber == 16 {
                    self.engine.playSound(soundName: self.engine.win!)
                    self.goToLadderVC(sender)
                } else {
                    self.engine.playSound(soundName: self.engine.rightAnswer!)
                    self.goToLadderVC(sender)
                }
            } else {
                self.checkGarantMoney()
                self.engine.playSound(soundName: self.engine.wrongAnswer!)
                sender.setBackgroundImage(UIImage(named: "rectRed"), for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.goToWinOrLoseViewController()
                }
            }
        }
    }
    
    func checkGarantMoney() {
        if engine.winMoney < 1000 {
            engine.winMoney = 0
        }
        if engine.winMoney >= 1000 && engine.winMoney < 32000 {
            engine.winMoney = 1000
        }
        if engine.winMoney >= 32000 {
            engine.winMoney = 32000
        }
    }
    
    func goToLadderVC(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "rectGreen"), for: .normal)
        let ladderViewController = self.storyboard?.instantiateViewController(withIdentifier: "LadderVC") as! LadderVC
        ladderViewController.qNumberToFlash = self.engine.qNumber - 1
        self.navigationController?.pushViewController(ladderViewController, animated: true)
    }
    
    func goToWinOrLoseViewController() {
        let winOrLoseViewController = self.storyboard?.instantiateViewController(withIdentifier: "WinOrLoseViewController") as! WinOrLoseViewController
        winOrLoseViewController.winSumm = self.engine.winMoney
        self.navigationController?.pushViewController(winOrLoseViewController, animated: true)
    }
    
    @IBAction func takeMoney(_ sender: Any) {
        engine.stopTimer()
        self.engine.playSound(soundName: self.engine.win!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.goToWinOrLoseViewController()
        }
    }
    
    @IBAction func FiftyFiftyButton(_ sender: UIButton) {
        let answers = [answerOne, answerTwo, answerThree, answerFour]
        engine.fiftyFiftyLogic(with: answers, sender: sender)
        sender.isEnabled = false // кнопка отключается
    }
    
    @IBAction func PeopleHelpButton(_ sender: UIButton) {
        let answers = [answerOne, answerTwo, answerThree, answerFour]
        engine.helpButtonLogic(with: answers, chance: 70, sender: sender, image: "Frame 8")
        sender.isEnabled = false
    }
    
    @IBAction func CallToFriendButton(_ sender: UIButton) {
        let answers = [answerOne, answerTwo, answerThree, answerFour]
        engine.helpButtonLogic(with: answers, chance: 80, sender: sender, image: "Frame 9")
        sender.isEnabled = false
    }
}

extension GameVC: CounterDelegate {
    func updateCounter(counter: Int) {
        if counter == 0 {
            checkGarantMoney()
            engine.playSound(soundName: self.engine.wrongAnswer!)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.goToWinOrLoseViewController()
            }
        }
        timerLabel.text = String(counter)
    }
}
