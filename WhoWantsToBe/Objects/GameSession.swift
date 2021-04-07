//
//  GameSession.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import Foundation

class GameSession: Codable {
    var questionsCount: Int
    var rightAnswersCount : Int
    var date: Date
    
    var rang: Rang {
        let rightAnswersPercent = Double(rightAnswersCount)/Double(questionsCount)
        switch rightAnswersPercent {
        case 0..<0.25:
            return .monkey
        case 0.25..<0.5:
            return .child
        case 0.5..<0.75:
            return .human
        case 0.75..<1:
            return .god
        default:
            return .unknown
        }
    }
    
    init(questionsCount: Int, rightAnswersCount: Int, date: Date) {
        self.questionsCount = questionsCount
        self.rightAnswersCount = rightAnswersCount
        self.date = date
    }
    convenience init(){
        self.init(questionsCount: 0, rightAnswersCount: 0, date: Date())
    }    
}

extension GameSession : GameSessionDelegate{
    func didEndGame(questionsCount: Int, rightAnswersCount: Int, date: Date) {
        self.questionsCount = questionsCount
        self.rightAnswersCount = rightAnswersCount
        self.date = date
    }
}


enum Rang {
    case monkey
    case child
    case human
    case god
    case unknown
}



