//
//  SharedUserDefault.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation

let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefault.suiteName)

struct SharedUserDefault {
    static let suiteName = "logos"
    
}
