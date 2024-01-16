//
//  OpenAIModel.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 16.01.2024.
//

import Foundation

struct OpenAIResponse: Codable {
    var id: Int
    var object: String
    var created: Int
    var model: String
    var choices: [Choice]
}

struct Choice: Codable {
    var text: String
    var index: Int
    var logrobs: String?
    var finish_reason: String
}
