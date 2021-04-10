//
//  CachingManager.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation
import UIKit

class CachingManager {
    
    static let sharedCache: CachingManager = CachingManager()
    
    private let cachedImages = NSCache<NSString, UIImage>()
    
    private init() {
        
    }
    
    func getImageFor(key: String) -> UIImage? {
        if let cachedImage = self.cachedImages.object(forKey: key as NSString) {
            return cachedImage
        }
       return nil
    }
    
    func chacheImage(_ image: UIImage, forKey key: String) {
        self.cachedImages.setObject(image, forKey: key as NSString)
    }
}
