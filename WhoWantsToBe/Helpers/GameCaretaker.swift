//
//  GameCaretaker.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import Foundation
class GameCaretaker {
    typealias Memento = Data
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "game"
    
    func saveGame(_ game: GameSession) throws {
        let data: Memento = try encoder.encode(game)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadGame() throws -> [GameSession] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Memento
            , let game = try? decoder.decode([GameSession].self, from: data) else {
                throw Error.gameNotFound
        }
        return game
    }
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}


