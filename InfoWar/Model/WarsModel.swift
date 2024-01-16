//
//  WarsModel.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 4.01.2024.
//

import Foundation

struct WarsModel: Decodable {
//    let id, warId, warInfo, warName: String?
//    let startingDate: String?
//    let isItOver: Bool?
    let id, warId, warInfo, warName: String?
        let countrySideA: String?
        let deathsKidSideA, deathsAdultSideA, deathsSoldierSideA: Int?
        let countrySideB: String?
        let deathsKidSideB, deathsAdultSideB, deathsSoldierSideB: Int?
        let startingDate: String?
        let isItOver: Bool?
        let warImage: String?
}
