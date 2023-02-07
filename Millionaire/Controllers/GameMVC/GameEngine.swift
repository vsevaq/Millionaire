//
//  GameEngine.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 6.02.23.
//

import Foundation

class GameEngine {
   
    var score: Int = 100
    var qNumber: Int = 0
    var currentQuestion: Question?
    var usedQuestions: [Int] = []
    
    func getStartQuestion() {
        currentQuestion = qLevelOne[0]
        usedQuestions.append(currentQuestion?.id ?? 1000)
    }
    
    func getNextQuestion() {
        if qNumber < 5 {
            qNumber += 1
            currentQuestion = qLevelOne[qNumber]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber > 4 || qNumber < 10 {
            qNumber += 1
            currentQuestion = qLevelTwo[qNumber - 6]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
        
        if qNumber > 9 {
            qNumber += 1
            currentQuestion = qLevelTree[qNumber - 11]
            usedQuestions.append(currentQuestion?.id ?? 1000)
        }
    }
    
    func resetGame() {
        score = 100
        qNumber = 0
        usedQuestions = []
    }
    
    func checkAnswer(answer: String) -> Bool {
        if currentQuestion?.correctAnswer ?? "Some error" == answer {
            score += 1
            return true
        }
        return false
    }
    
}

