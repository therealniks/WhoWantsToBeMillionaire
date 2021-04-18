//
//  QuestionCaretaker.swift
//  WhoWantsToBe
//
//  Created by N!kS on 10.04.2021.
//

import Foundation

class QuestionCaretaker {
    
    typealias Memento = Data
    let key = Keys.question.rawValue
    
    
    func saveQuestion(_ question: Question) throws {
        let newQuestion = Question(question: question.question, answers: question.answers)
        var userQuestion = Game.shared.userQuestions
        userQuestion.append(newQuestion)
        let data = try JSONEncoder().encode(userQuestion)
        UserDefaults.standard.set(data, forKey: key)
        print("saveIsOk")
        
    }
    
    func loadQuestions()-> [Question] {
        guard
            let data = UserDefaults.standard.value(forKey: key) as? Memento,
            let userQuestions = try? JSONDecoder().decode([Question].self,from: data)
        else { return []}
        Game.shared.userQuestions = userQuestions
        return Game.shared.userQuestions
    }
    
}
