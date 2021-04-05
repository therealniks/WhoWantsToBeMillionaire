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
    var rang: Rang{
        let rightAnswersPercent = Double(rightAnswersCount)/Double(questionsCount)
        switch rightAnswersPercent {
        case 0..<0.25:
            return .Monkey
        case 0.25..<0.5:
            return .Child
        case 0.5..<0.75:
            return .Human
        case 0.75..<1:
            return .God
        default:
            return .Unknown
        }
    }
    
    init(questionsCount: Int,rightAnswersCount : Int,date:Date) {
        self.questionsCount = questionsCount
        self.rightAnswersCount = rightAnswersCount
        self.date = date
    }

    
    
}
enum Rang{
    case Monkey
    case Child
    case Human
    case God
    case Unknown
}



