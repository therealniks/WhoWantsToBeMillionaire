//
//  GameCaretaker.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import Foundation


enum Keys: String {
    case record = "record"
    case question = "question"
}

class GameCaretaker {
    let key = Keys.record.rawValue
    func save(_ records: [Result]) {
        do {
            let memento = try JSONEncoder().encode(records)
            UserDefaults.standard.set(memento, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Result] {
        guard let memento = UserDefaults.standard.value(forKey: key) as? Data  else {
           return []
        }
        return (try? JSONDecoder().decode([Result].self, from: memento)) ?? []
    }


}

    

    

