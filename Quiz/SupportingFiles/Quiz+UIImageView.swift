//
//  Quiz+UIImageView.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import UIKit

extension UIImageView {
    
    func fetchImage(fromURL url: String?, animated: Bool = false ) {
        
        // Check for Image URL
        if let imageUrl = url, !imageUrl.isEmpty {
            
            // Check for Cached Data
            
            if let cachedImage = CachingManager.sharedCache.getImageFor(key: imageUrl) {
                self.setImageWithFadeAnimation(animated: animated, image: cachedImage)
                return
                
            }
            
            NetworkManager.downloadImage(fromUrl: imageUrl) { [weak self] image in
                
                if let downloadedImage = image {
                    
                    //Setting Image
                    DispatchQueue.main.async {
                        self?.setImageWithFadeAnimation(animated: animated, image: downloadedImage)
                    }
                    // Caching Image
                    CachingManager.sharedCache.chacheImage(downloadedImage, forKey: imageUrl)
                }
            }
        }
    }
    
    func setImageWithFadeAnimation(animated: Bool, image: UIImage) {
        self.image = image
        if animated {
            let transition = CATransition()
            transition.duration = 0.4
            transition.type = .fade
            self.layer.add(transition, forKey: nil)
        }
    }
}
