//
//  ImageFetcher.swift
//  NikeChallenge
//
//  Created by Consultant on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation
import UIKit

class ImageFetcher {
    private var runningOperations = [UUID: BlockOperation]()
    private var operationQueue = OperationQueue()
    private var imageCache = NSCache<NSString,AnyObject>()

    func loadImage(_ url: String, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID?
    {
        
        if let cachedImage =  imageCache.object(forKey:
        NSString(string: url)) as? UIImage{
            completion(.success(cachedImage))
            return nil
        }
        
        let uniqueId = UUID()
        
        let imageOperation = BlockOperation{
            
            defer { self.runningOperations.removeValue(forKey: uniqueId) }
            
            if let imageUrl = URL(string: url) {
                imageUrl.getImage{ [weak self] image in
                    guard let image = image else {return}
                    self?.imageCache.setObject(image, forKey: NSString(string: url))
                    completion(.success(image))
                }
            }
        }
        
        operationQueue.addOperation(imageOperation)
        
        runningOperations[uniqueId] = imageOperation
        
        return uniqueId
    }
    
    func cancelLoad(_ uuid: UUID) {
        runningOperations[uuid]?.cancel()
        runningOperations.removeValue(forKey: uuid)
    }
    
    
}
