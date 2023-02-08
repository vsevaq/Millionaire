//
//  GameEngine.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 6.02.23.
//

import Foundation
import UIKit

class GameEngine {
   
    var score: Int = 0
    var qNumber: Int = 1
    var currentQuestion: Question?
    var usedQuestions: [Int] = []
    
    func getStartQuestion() {
        score = questionMoney[qNumber] ?? 9999
        currentQuestion = qLevelOne[0]
        usedQuestions.append(currentQuestion?.id ?? 1000)
    }
    
    func getNextQuestion() {
        
        qNumber += 1
        
        if qNumber < 6 {
        //   qNumber += 1
            score = questionMoney[qNumber] ?? 99999
            currentQuestion = qLevelOne[qNumber - 1]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber >= 6 && qNumber < 11 {
         //   qNumber += 1
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTwo[qNumber - 6]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber >= 11 && qNumber < 16 {
        //    qNumber += 1
            score = questionMoney[qNumber] ?? 9999
            currentQuestion = qLevelTree[qNumber - 11]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
    }
    
    func resetGame() {
        score = 100
        qNumber = 1
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
    

    
    
}

