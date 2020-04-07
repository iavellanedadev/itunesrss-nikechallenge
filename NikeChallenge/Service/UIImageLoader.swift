//
//  UIImageLoader.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation
import UIKit

final class UIImageLoader {
    static let loader = UIImageLoader()
    
    private let imageFetcher = ImageFetcher()
    private var imageIdStorage = [UIImageView: UUID]()

    private init() {}

    func load(_ url: String, for imageView: UIImageView) {
        
        let token = imageFetcher.loadImage(url) { result in
          
            defer { self.imageIdStorage.removeValue(forKey: imageView) }
            do {
            
                let image = try result.get()
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } catch {
                print("Error Loading Image: \(error.localizedDescription)")
            }
        }
        
        if let token = token {
            imageIdStorage[imageView] = token
        }
    }

    func cancel(for imageView: UIImageView) {
        if let uuid = imageIdStorage[imageView] {
            imageFetcher.cancelLoad(uuid)
            imageIdStorage.removeValue(forKey: imageView)
        }
    }
}
