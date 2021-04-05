//
//  Game.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import Foundation

final class Game{

    static let shared = Game()
    private let recordsProvider = GameCaretaker()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsProvider.save(records: self.records)
        }
    }
    

    
    private init() {
        self.records = self.recordsProvider.retrieveRecords()
    }
    
    func addRecord(_ record: GameSession) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
