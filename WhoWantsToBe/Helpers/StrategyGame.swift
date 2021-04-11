//
//  StrategyGame.swift
//  WhoWantsToBe
//
//  Created by N!kS on 08.04.2021.
//

import Foundation

protocol StrategyGameProtocol {
    func getQuestions() -> [Question]
}

class StrategyGame: StrategyGameProtocol {
    private let questions: [Question]
    
    init(_ questions: [Question]){
        self.questions = questions
    }
    
    func getQuestions() -> [Question] {
        questions
    }
    func getQuestionsShuffled() -> [Question] {
        questions.shuffled()
    }
    
    
}
