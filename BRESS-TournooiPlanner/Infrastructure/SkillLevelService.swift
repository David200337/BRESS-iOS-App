//
//  SkillLevelService.swift
//  BRESS-TournooiPlanner
//
//  Created by Bas Buijsen on 06/01/2022.
//

import Foundation

func getAllSkillLevels() async throws -> [SkillLevel] {
    let token = getUserToken()
    
    let url = URL(string: "\(apiURL)/skilllevel")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    let(data, _) = try await URLSession.shared.data(for: request)
    
    do{
        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
        print(jsonResponse)
        
        let decoder = JSONDecoder()
        let model = try decoder.decode(SkillLevelWrapper.self, from: data)
            
        return model.result
    } catch let parsingError{
        print("error", parsingError)
    }
    
    return []
}
