//
//  StrategyGame.swift
//  WhoWantsToBe
//
//  Created by N!kS on 08.04.2021.
//

import Foundation

protocol StrategyGameProtocol {
    func getQuestions(questions: [Question]) -> [Question]
}

class StrategyGameConsistent: StrategyGameProtocol {
    func getQuestions(questions: [Question]) -> [Question] {
        questions
    }
}
class StrategyGameShuffled: StrategyGameProtocol{
    func getQuestions(questions: [Question]) -> [Question] {
        questions.shuffled()
    }
}
