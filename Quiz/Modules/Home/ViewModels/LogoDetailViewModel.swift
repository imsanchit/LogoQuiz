//
//  LogoDetailViewModel.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation

class LogoDetailViewModel: NSObject {
    
    private let logo: LogoEntity
    
    init(logo: LogoEntity) {
        self.logo = logo
    }
    
    var imageUrl: String {
        self.logo.imgUrl
    }
}
