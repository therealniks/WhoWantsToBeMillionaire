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
    
    lazy var questions : Questions = {
        return loadQuestions()
    }()
    
    func saveQuestions(_ question: Question) throws {
        let id = questions.getQuestions().count
        let newQuestion = Question(id: id, question: question.question, answers: question.answers)
        questions.userQuestions.append(newQuestion)
        let data = try JSONEncoder().encode(questions.userQuestions)
        UserDefaults.standard.set(data, forKey: key)
        print("saveIsOk")
        
    }
    
    func loadQuestions()-> Questions {
        guard
            let data = UserDefaults.standard.value(forKey: key) as? Memento,
            let userQuestions = try? JSONDecoder().decode([Question].self,from: data)
        else {
            return Questions()
        }
        var questions = Questions()
        questions.userQuestions = userQuestions
        return questions
    }
    
}
