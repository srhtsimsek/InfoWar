//
//  APICaller.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 10.01.2024.
//

import SwiftOpenAI
import OpenAISwift
import Foundation

final class InfoWarChatGptAPICaller {
    let openAIUrl =  URL(string: "https://api.openai.com/v1/engines/davinci/completions")
    var openAIKey: String {
        return Config.openAIKey
    }
    
    private func executeRequest(request: URLRequest, withSessionConfig sessionConfig: URLSessionConfiguration?) -> Data? {
        let semaphore = DispatchSemaphore(value: 0)
        let session: URLSession
        
        if(sessionConfig != nil) {
            session = URLSession(configuration: sessionConfig!)
        } else {
            session = URLSession.shared
        }
        
        var requestData: Data?
        let task = session.dataTask(with: request as URLRequest, completionHandler:{ (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error != nil {
                print("error: \(error!.localizedDescription)")
            } else if data != nil {
                requestData = data
            }
            print("semaphore signalled")
            semaphore.signal()
        })
        task.resume()
        let timeout = DispatchTime.now() + .seconds(20)
        print("waiting for semaphore signal")
        let retVal = semaphore.wait(timeout: timeout)
        print("Done waiting, obtained - \(retVal)")
        return requestData
    }
    public func processPrompt(prompt: String) -> Optional<String> {
        var request = URLRequest(url: self.openAIUrl!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(self.openAIKey)", forHTTPHeaderField: "Authorization")
        let httpBody: [String: Any] = [
            "promt": prompt,
            "max_tokens": 100
        ]
        var httpBodyJson: Data
        do {
            httpBodyJson = try  JSONSerialization.data(withJSONObject: httpBody, options: .prettyPrinted)
        } catch {
            print("Unable to convert to Json \(error)")
            return nil
        }
        request.httpBody = httpBodyJson
        if let requestData = executeRequest(request: request, withSessionConfig: nil) {
            let jsonStr = String(data: requestData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            print(jsonStr)
            let responseHandler = OpenAIResponseHandler()
            return responseHandler.decodeJson(jsonString: jsonStr)?.choices[0].text
            
        }
        return nil
    }
}

struct OpenAIResponseHandler {
    func decodeJson(jsonString: String) -> OpenAIResponse? {
        let json = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(OpenAIResponse.self, from: json)
            return product
        } catch {
            print("Error decoding  OpenAI API Response")
        }
        return nil
    }
}
