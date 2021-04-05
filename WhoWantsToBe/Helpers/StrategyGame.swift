//
//  StrategyGame.swift
//  WhoWantsToBe
//
//  Created by N!kS on 04.04.2021.
//

import Foundation

protocol StrategyGame {
    func getQuestions() -> [Question]
}


class StrategyGames: StrategyGame {
    private let questions: [Question]
    
    init(_ questions: [Question]) {
        self.questions = questions
    }
    
    func getQuestions() -> [Question] {
        return questions.shuffled()
    }
}
