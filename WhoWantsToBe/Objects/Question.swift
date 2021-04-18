//
//  Question.swift
//  WhoWantsToBe
//
//  Created by N!kS on 03.04.2021.
//

import Foundation

struct Question: Codable {
    var question : String
    var answers : [String:Bool]
}

extension Array where Element == Question {
    static var defaultQuestion: [Question] = [
        Question.init(
            question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
            answers: [
                "Один" : false,
                "Два" : true,
                "Три" : false,
                "Четыре" : false
            ]),
        Question.init(
            question: "Кто 1-м получил Нобелевскую премию по литературе?",
            answers: [
                "Романист" : false,
                "Драматург" : false,
                "Поэт" : true,
                "Эссеист" : false
            ]),
        Question.init(
            question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?",
            answers: [
                "М" : true,
                "Н" : false,
                "О" : false,
                "П" : false
            ]),
        Question.init(
            question: "Какой химический элемент назван в честь злого подземного гнома?",
            answers: [
                "Гафний" : false,
                "Кобальт" : true,
                "Бериллий" : false,
                "Теллур" : false
            ]),
        Question.init(
            question: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
            answers: [
                "Тбилиси" : true,
                "Ереван" : false,
                "Баку" : false,
                "Минск" : false
            ]),
        Question.init(
            question: "Сколько морей омывают Балканский полуостров?",
            answers: [
                "3" : false,
                "4" : false,
                "5" : false,
                "6" : true
            ]),
        Question.init(
            question: "Реки с каким названием нет на территории России?",
            answers: [
                "Шея" : false,
                "Уста" : false,
                "Спина" : true,
                "Палец" : false
            ]),
        Question.init(
            question: "Что запрещал указ, который в 1726 году подписала Екатерина I?",
            answers: [
                "Точить лясы" : false,
                "Бить баклуши" : false,
                "Пускать пыль в глаза" : true,
                "Переливать из пустого в порожнее" : false
            ]),
        Question.init(
            question: "Какое государство ежегодно дарит Лондону ёлку для Трафальгарской площади?",
            answers: [
                "Дания" : false,
                "Норвегия" : true,
                "Швеция" : false,
                "Эстония" : false
            ]),
        Question.init(
            question: "Как называется единственное в Европе герцогство?",
            answers: [
                "Монако" : false,
                "Андорра" : true,
                "Люксембург" : false,
                "Лихтенштейн" : false
            ])
    ]
}
