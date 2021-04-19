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
