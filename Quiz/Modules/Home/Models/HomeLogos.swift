//
//  HomeLogos.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation

class HomeLogos {
    
    //MARK: - Fetches home page logos
    static func homeLogoEntities() -> [LogoEntity] {
        
        var logoEntities: [LogoEntity] = []
        
        let bundleFileName = "Logos"
        
        let filePath = Bundle.main.path(forResource: bundleFileName, ofType: "json")
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: filePath ?? "")), let logos = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
            for logo in logos {
                if let entityJsonData = try? JSONSerialization.data(withJSONObject: logo, options: []), let entity = try? JSONDecoder().decode(LogoEntity.self, from: entityJsonData) {
                    logoEntities.append(entity)
                }
            }
        }
        return logoEntities
    }
}
