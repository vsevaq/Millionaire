//
//  GameEngine.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 6.02.23.
//

import Foundation
import UIKit
import AVFoundation

class GameEngine {
    
    var player: AVAudioPlayer?
    
    var score: Int = 0
    var qNumber: Int = 1
    var currentQuestion: Question?
    var usedQuestions: [Int] = []
    
    let countdown = Bundle.main.url(forResource: "Countdown", withExtension: "mp3")
    let wrongAnswer = Bundle.main.url(forResource: "Wrong answer", withExtension: "mp3")
    let answerAccepted = Bundle.main.url(forResource: "Answer accepted", withExtension: "mp3")
    let rightAnswer = Bundle.main.url(forResource: "Right answer", withExtension: "mp3")
    let win = Bundle.main.url(forResource: "Win", withExtension: "mp3")
    
    func getStartQuestion() {
        score = questionMoney[qNumber] ?? 9999
        currentQuestion = qLevelOne[0]
        usedQuestions.append(currentQuestion?.id ?? 1000)
    }
    
    func getNextQuestion() {
        qNumber += 1
        
        if qNumber < 6 {
            score = questionMoney[qNumber] ?? 99999
            currentQuestion = qLevelOne[qNumber - 1]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber >= 6 && qNumber < 11 {
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTwo[qNumber - 6]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber >= 11 && qNumber < 16 {
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTree[qNumber - 11]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
    }
    
    func resetGame() {
        score = 100
        qNumber = 14
        usedQuestions = []
    }
    
    func checkAnswer(answer: String) -> Bool {
        if currentQuestion?.correctAnswer ?? "Some error" == answer {
            print("Ответ верный")
            getNextQuestion()
            return true
        } else {
            print("Ответ не верный")
            return false
        }
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
    
    func startTimer() {
        
    }
    
    func stopSound() {
        player?.stop()
    }
    
    
    func fiftyFiftyLogic (with answers: [UIButton?], sender: UIButton) {
        var wrongAnswers = 0
        
            for answer in answers {
                if currentQuestion?.correctAnswer ?? "Some error" != answer?.currentTitle && wrongAnswers != 2 {
                    answer?.setBackgroundImage(UIImage(named: "rectRed"), for: .normal)
                    wrongAnswers += 1
                }
                sender.setImage(UIImage(named: "Frame 7"), for: .normal)
            }
    }
    
    var helpCounter = 0
    
    func helpButtonLogic (with answers: [UIButton?], chance: Int, sender: UIButton, image: String) {
        
        if helpCounter < 2 { // два раза можно исп функцию
            var arrayOfChances = Array (repeatElement(currentQuestion?.correctAnswer, count: chance))
        // создаем массив из 70 или 80 правильных ответов
                repeat {
                    for i in currentQuestion?.qAnswers ?? [""] {
                        if currentQuestion?.correctAnswer ?? "Some error" != i {
                            arrayOfChances.append(i)
                        }
                    }
                } while arrayOfChances.count <= 100
            // добавляем 20 неправильных ответов к массиву
        
            let randomValue = arrayOfChances.randomElement() // выбираем рандом ответ
            for answer in answers { // красим выбранный ответ
                if answer?.titleLabel?.text == randomValue {
                    answer!.setBackgroundImage(UIImage(named: "rectYellow"), for: .normal)
                }
            }
            sender.setImage(UIImage(named: image), for: .normal) // меняем имедж сендера
            helpCounter += 1
        }
    }
    
}
