import Foundation
import UIKit
import AVFoundation

class GameEngine {
    
    weak var counterDelegate: CounterDelegate?
    
    var player: AVAudioPlayer?
    var counter = 30
    var timer = Timer()
    var winMoney: Int = 0
    var score: Int = 0
    var qNumber: Int = 1
    var currentQuestion: Question?
    var wrongAnswers = 0
    var helpCounter = 0
    
    let countdown = Bundle.main.url(forResource: "Countdown", withExtension: "mp3")
    let wrongAnswer = Bundle.main.url(forResource: "Wrong answer", withExtension: "mp3")
    let answerAccepted = Bundle.main.url(forResource: "Answer accepted", withExtension: "mp3")
    let rightAnswer = Bundle.main.url(forResource: "Right answer", withExtension: "mp3")
    let win = Bundle.main.url(forResource: "Win", withExtension: "mp3")
    
    func getStartQuestion() {
        score = questionMoney[qNumber] ?? 9999
        currentQuestion = qLevelOne[0]
    }
    
    func getNextQuestion() {
        qNumber += 1
        if qNumber < 6 {
            score = questionMoney[qNumber] ?? 99999
            currentQuestion = qLevelOne[qNumber - 1]
        }
        if qNumber >= 6 && qNumber < 11 {
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTwo[qNumber - 6]
        }
        if qNumber >= 11 && qNumber < 16 {
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTree[qNumber - 11]
        }
    }
    
    func resetGame() {
        score = 100
        qNumber = 1
        stopTimer()
        stopSound()
    }
    
    func checkAnswer(answer: String) -> Bool {
        if currentQuestion?.correctAnswer ?? "Some error" == answer {
            getNextQuestion()
            return true
        } else { return false }
    }
    
    func playSound(soundName: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: soundName, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        player?.stop()
    }
    
    func startTimer() {
        counter = 30
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counter -= 1
        counterDelegate?.updateCounter(counter: counter)
        if counter == 0 { stopTimer() }
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func fiftyFiftyLogic (with answers: [UIButton?], sender: UIButton) {
        for answer in answers {
            if currentQuestion?.correctAnswer ?? "Some error" != answer?.currentTitle && wrongAnswers != 2 {
                answer?.setBackgroundImage(UIImage(named: "rectRed"), for: .normal)
                wrongAnswers += 1
            }
            sender.setImage(UIImage(named: "Frame 7"), for: .normal)
        }
    }
    
    func helpButtonLogic (with answers: [UIButton?], chance: Int, sender: UIButton, image: String) {
        if helpCounter < 2 { // ?????? ???????? ?????????? ?????? ??????????????
            var arrayOfChances = Array (repeatElement(currentQuestion?.correctAnswer, count: chance))
            // ?????????????? ???????????? ???? 70 ?????? 80 ???????????????????? ??????????????
            repeat {
                for i in currentQuestion?.qAnswers ?? [""] {
                    if currentQuestion?.correctAnswer ?? "Some error" != i {
                        arrayOfChances.append(i)
                    }
                }
            } while arrayOfChances.count <= 100
            // ?????????????????? 20 ???????????????????????? ?????????????? ?? ??????????????
            let randomValue = arrayOfChances.randomElement() // ???????????????? ???????????? ??????????
            for answer in answers { // ???????????? ?????????????????? ??????????
                if answer?.titleLabel?.text == randomValue {
                    answer!.setBackgroundImage(UIImage(named: "rectYellow"), for: .normal)
                }
            }
            sender.setImage(UIImage(named: image), for: .normal) // ???????????? ?????????? ??????????????
            helpCounter += 1
        }
    }
}
