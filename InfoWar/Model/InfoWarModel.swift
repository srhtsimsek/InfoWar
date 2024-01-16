//
//  InfoWarModel.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 28.12.2023.
//

import Foundation

// MARK: - InfoWarModel

struct InfoWarModel: Codable{
    let totalCount, totalPages: Int?
    let previousPageURL, nextPageURL: String?
    var result: [Result]?
    
    private enum CodingKeys: String, CodingKey{
        case totalCount = "TotalCount"
        case totalPages = "TotalPages"
        case previousPageURL = "PreviousPageUrl"
        case nextPageURL = "NextPageUrl"
        case result = "Result"
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
            self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
            self.previousPageURL = try container.decodeIfPresent(String.self, forKey: .previousPageURL)
            self.nextPageURL = try container.decodeIfPresent(String.self, forKey: .nextPageURL)
            self.result = try container.decodeIfPresent([Result].self, forKey:  .result)
        }
}

// MARK: - Result

struct Result: Codable{
    
    let id: Int?
    let relid: String?
    let year: Int?
    let activeYear: Bool?
    let codeStatus: String?
    let typeOfViolence: Int?
    let conflictDsetID: String?
    let conflictNewID: Int?
    let conflictName, dyadDsetID: String?
    let dyadNewID: Int?
    let dyadName, sideADsetID: String?
    let sideANewID: Int?
    let sideA, sideBDsetID: String?
    let sideBNewID: Int?
    let sideB: String?
    let numberOfSources: Int?
    let sourceArticle, sourceOffice, sourceDate, sourceHeadline: String?
    let sourceOriginal: String?
    let wherePrec: Int?
    let whereCoordinates, whereDescription, adm1, adm2: String?
    let latitude, longitude: Double?
    let geomWkt: String?
    let priogridGid: Int?
    let country: String?
    let countryID: Int?
    let region: String?
    let eventClarity, datePrec: Int?
    let dateStart, dateEnd: String?
    let deathsA, deathsB, deathsCivilians, deathsUnknown: Int?
    let best, high, low: Int?
    let gwnoa: String?
    let gwnob: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case relid
        case year
        case activeYear = "active_year"
        case codeStatus = "code_status"
        case typeOfViolence = "type_of_violence"
        case conflictDsetID = "conflict_dset_id"
        case conflictNewID = "conflict_new_id"
        case conflictName = "conflict_name"
        case dyadDsetID = "dyad_dset_id"
        case dyadNewID = "dyad_new_id"
        case dyadName = "dyad_name"
        case sideADsetID = "side_a_dset_id"
        case sideANewID = "side_a_new_id"
        case sideA = "side_a"
        case sideBDsetID = "side_b_dset_id"
        case sideBNewID = "side_b_new_id"
        case sideB = "side_b"
        case numberOfSources = "number_of_sources"
        case sourceArticle = "source_article"
        case sourceOffice = "source_office"
        case sourceDate = "source_date"
        case sourceHeadline = "source_headline"
        case sourceOriginal = "source_original"
        case wherePrec = "where_prec"
        case whereCoordinates = "where_coordinates"
        case whereDescription = "where_description"
        case adm1
        case adm2
        case latitude
        case longitude
        case geomWkt = "geom_wkt"
        case priogridGid = "priogrid_gid"
        case country
        case countryID = "country_id"
        case region
        case eventClarity = "event_clarity"
        case datePrec = "date_prec"
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case deathsA = "deaths_a"
        case deathsB = "deaths_b"
        case deathsCivilians = "deaths_civilians"
        case deathsUnknown = "deaths_unknown"
        case best, high, low
        case gwnoa
        case gwnob
       
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.relid = try container.decodeIfPresent(String.self, forKey: .relid)
        self.year = try container.decodeIfPresent(Int.self, forKey: .year)
        self.activeYear = try container.decodeIfPresent(Bool.self, forKey: .activeYear)
        self.codeStatus = try container.decodeIfPresent(String.self, forKey: .codeStatus)
        self.typeOfViolence = try container.decodeIfPresent(Int.self, forKey: .typeOfViolence)
        self.conflictDsetID = try container.decodeIfPresent(String.self, forKey: .conflictDsetID)
        self.conflictNewID = try container.decodeIfPresent(Int.self, forKey: .conflictNewID)
        self.conflictName = try container.decodeIfPresent(String.self, forKey: .conflictName)
        self.dyadDsetID = try container.decodeIfPresent(String.self, forKey: .dyadDsetID)
        self.dyadNewID = try container.decodeIfPresent(Int.self, forKey: .dyadNewID)
        self.dyadName = try container.decodeIfPresent(String.self, forKey: .dyadName)
        self.sideADsetID = try container.decodeIfPresent(String.self, forKey: .sideADsetID)
        self.sideANewID = try container.decodeIfPresent(Int.self, forKey: .sideANewID)
        self.sideA = try container.decodeIfPresent(String.self, forKey: .sideA)
        self.sideBDsetID = try container.decodeIfPresent(String.self, forKey: .sideBDsetID)
        self.sideBNewID = try container.decodeIfPresent(Int.self, forKey: .sideBNewID)
        self.sideB = try container.decodeIfPresent(String.self, forKey: .sideB)
        self.numberOfSources = try container.decodeIfPresent(Int.self, forKey: .numberOfSources)
        self.sourceArticle = try container.decodeIfPresent(String.self, forKey: .sourceArticle)
        self.sourceOffice = try container.decodeIfPresent(String.self, forKey: .sourceOffice)
        self.sourceDate = try container.decodeIfPresent(String.self, forKey: .sourceDate)
        self.sourceHeadline = try container.decodeIfPresent(String.self, forKey: .sourceHeadline)
        self.sourceOriginal = try container.decodeIfPresent(String.self, forKey: .sourceOriginal)
        self.wherePrec = try container.decodeIfPresent(Int.self, forKey: .wherePrec)
        self.whereCoordinates = try container.decodeIfPresent(String.self, forKey: .whereCoordinates)
        self.whereDescription = try container.decodeIfPresent(String.self, forKey: .whereDescription)
        self.adm1 = try container.decodeIfPresent(String.self, forKey: .adm1)
        self.adm2 = try container.decodeIfPresent(String.self, forKey: .adm2)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.geomWkt = try container.decodeIfPresent(String.self, forKey: .geomWkt)
        self.priogridGid = try container.decodeIfPresent(Int.self, forKey: .priogridGid)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.countryID = try container.decodeIfPresent(Int.self, forKey: .countryID)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.eventClarity = try container.decodeIfPresent(Int.self, forKey: .eventClarity)
        self.datePrec = try container.decodeIfPresent(Int.self, forKey: .datePrec)
        self.dateStart = try container.decodeIfPresent(String.self, forKey: .dateStart)
        self.dateEnd = try container.decodeIfPresent(String.self, forKey: .dateEnd)
        self.deathsA = try container.decodeIfPresent(Int.self, forKey: .deathsA)
        self.deathsB = try container.decodeIfPresent(Int.self, forKey: .deathsB)
        self.deathsCivilians = try container.decodeIfPresent(Int.self, forKey: .deathsCivilians)
        self.deathsUnknown = try container.decodeIfPresent(Int.self, forKey: .deathsUnknown)
        self.best = try container.decodeIfPresent(Int.self, forKey: .best)
        self.high = try container.decodeIfPresent(Int.self, forKey: .high)
        self.low = try container.decodeIfPresent(Int.self, forKey: .low)
        self.gwnoa = try container.decodeIfPresent(String.self, forKey: .gwnoa)
        self.gwnob = try container.decodeIfPresent(String.self, forKey: .gwnob)
        
    }
}

