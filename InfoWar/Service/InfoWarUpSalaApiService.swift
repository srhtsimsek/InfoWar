//
//  InfoWarService.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 28.12.2023.

import Foundation
import Alamofire

protocol ServiceProcol {
    func fetchAllPosts(onSuccess: @escaping ([InfoWarModel])-> Void, onFail: @escaping (String?) -> Void)
}

enum InfoWarPath: String {
    case POSTS = "/api/gedevents/23.1?pagesize=15"
}

extension InfoWarPath {
    func baseUrl() -> String {
        return "https://ucdpapi.pcr.uu.se\(self.rawValue)"
    }
}

struct InfoWarUpSalaApiService: ServiceProcol  {
    func fetchAllPosts(onSuccess: @escaping ([InfoWarModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(InfoWarPath.POSTS.baseUrl(), method: .get).validate().responseDecodable(of: InfoWarModel.self) { (response) in
            switch response.result {
            case .success(let infoWarModel):
                print("Başarılı.")
                onSuccess([infoWarModel])
            case .failure(let error):
                print("Başarısız: \(error)")
                onFail(error.localizedDescription)
            }
        }
    }
}
