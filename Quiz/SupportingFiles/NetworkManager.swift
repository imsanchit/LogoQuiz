//
//  NetworkManager.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation
import UIKit

class NetworkManager {
    
    class func downloadImage(fromUrl url: String, completionHandler: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.downloadTask(with: URL(string: url)!) { urlResponse, response, error in
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let urlResponse = urlResponse, let data = try? Data(contentsOf: urlResponse) {
                if let image = UIImage(data: data) {
                    completionHandler(image)
                    return
                }
            }
            
            completionHandler(nil)
        }.resume()
    }
}
