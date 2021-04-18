//
//  Game.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import Foundation

final class Game {

    static let shared = Game()
    var currentGame: GameSession?
    private(set) var results : [Result] = []
    private let recorder = GameCaretaker()
    var sequencyQuestions = false
    var userQuestions: [Question] = []
    
    func addResult(_ result: Result) {
        self.results.append(result)
        recorder.save(results)
    }
    func getQuestions() -> [Question]{
        let questionCaretaker = QuestionCaretaker()
        userQuestions = questionCaretaker.loadQuestions()
        return userQuestions + Array.defaultQuestion
    }

    private init() {
        self.results = recorder.load()
    }
}




