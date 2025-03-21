//
//  ImageCacheManager.swift
//  Newsly
//
//  Created by Hewad Mubariz on 21.03.25.
//

// ImageCacheManager.swift

import Foundation
import SwiftUI

class ImageCacheManager {
    static let shared = ImageCacheManager()
    
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func saveImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
