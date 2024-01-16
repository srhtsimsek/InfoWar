//
//  InfoWarLocalApiService.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 11.01.2024.
//

import Foundation

class InfoWarLocalApiService {
    public var warItems: [WarsModel] = []
    
    func readJsonfWarsFile(){
        if let path = Bundle.main.path(forResource: "wars", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let warsResult = try jsonDecoder.decode([WarsModel].self, from: data)
                    print(warsResult.first!.warName ?? "empty")
                    warItems = warsResult
                } catch {
                    print(error)
                }
            } catch {
                // Hata işleme kodları
                print("JSON dosyası okunurken bir hata oluştu: \(error)")
            }
        }
        
    }
}
