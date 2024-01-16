//
//  Config.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 11.01.2024.
//

import Foundation
import SwiftOpenAI
struct Config {
    static var openAIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
                fatalError("Couldn't find file 'Config.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "OpenAI_API_Key") as? String else {
                fatalError("Couldn't find key 'OpenAI_API_Key' in 'Config.plist'.")
            }
            return value
        }
    }
}

var openAI = SwiftOpenAI(apiKey: Config.openAIKey)
