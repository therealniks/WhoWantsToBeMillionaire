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
    private(set) var games : [GameSession] = []
    private let recorder = GameCaretaker()
    
    private init() {}
    
    func recordSession() {
        guard let game = currentGame else {
            return
        }
        games.append(game)
        do {
            try recorder.saveGame(game)
        } catch {
            print("Error record")
        }
    }
}
