//
//  Question.swift
//  WhoWantsToBe
//
//  Created by N!kS on 03.04.2021.
//

import Foundation

struct Question: Codable {
    var id : Int
    var question : String
    var answers : [String:Bool]
}

struct Questions: Codable{
    var questions : [Question] = [
        Question.init(
            id: 0,
            question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
            answers: [
                "Один" : false,
                "Два" : true,
                "Три" : false,
                "Четыре" : false
            ]),
        Question.init(
            id: 1,
            question: "Кто 1-м получил Нобелевскую премию по литературе?",
            answers: [
                "Романист" : false,
                "Драматург" : false,
                "Поэт" : true,
                "Эссеист" : false
            ]),
        Question.init(
            id: 2,
            question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?",
            answers: [
                "М" : true,
                "Н" : false,
                "О" : false,
                "П" : false
            ]),
        Question.init(
            id: 3,
            question: "Какой химический элемент назван в честь злого подземного гнома?",
            answers: [
                "Гафний" : false,
                "Кобальт" : true,
                "Бериллий" : false,
                "Теллур" : false
            ]),
        Question.init(
            id: 4,
            question: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
            answers: [
                "Тбилиси" : true,
                "Ереван" : false,
                "Баку" : false,
                "Минск" : false
            ]),
        Question.init(
            id: 5,
            question: "Сколько морей омывают Балканский полуостров?",
            answers: [
                "3" : false,
                "4" : false,
                "5" : false,
                "6" : true
            ]),
        Question.init(
            id: 6,
            question: "Реки с каким названием нет на территории России?",
            answers: [
                "Шея" : false,
                "Уста" : false,
                "Спина" : true,
                "Палец" : false
            ]),
        Question.init(
            id: 7,
            question: "Что запрещал указ, который в 1726 году подписала Екатерина I?",
            answers: [
                "Точить лясы" : false,
                "Бить баклуши" : false,
                "Пускать пыль в глаза" : true,
                "Переливать из пустого в порожнее" : false
            ]),
        Question.init(
            id: 8,
            question: "Какое государство ежегодно дарит Лондону ёлку для Трафальгарской площади?",
            answers: [
                "Дания" : false,
                "Норвегия" : true,
                "Швеция" : false,
                "Эстония" : false
            ]),
        Question.init(
            id: 9,
            question: "Как называется единственное в Европе герцогство?",
            answers: [
                "Монако" : false,
                "Андорра" : true,
                "Люксембург" : false,
                "Лихтенштейн" : false
            ])
    
    ]
    
    func getQuestions() -> [Question]{
        questions
    }
    
    
}


