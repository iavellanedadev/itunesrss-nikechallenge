//
//  AppleiTunesService.swift
//  NikeChallenge
//
//  Created by Consultant on 4/4/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

protocol GetAlbums {
    func getAlbums(completion: @escaping CompletionHandler)
}

final class AppleiTunesService: GetAlbums {
    func getAlbums(completion: @escaping CompletionHandler) {
        
        var albums = [Album]()
        
        guard let url = URL(string: Constants.URL_MUSIC_FEED_100) else {
            let error = ErrorInfo(errorCode: .badUrl, errorDescription: "BAD URL", statusCode: 0)
            completion(.failure(error))
            return
            
        }
        
        URLSession.shared.dataTask(with: url){dat, _, err in
            if let error = err {
                let erroInfo = ErrorInfo(errorCode: .badRequest, errorDescription: "REQUEST ERROR: \(error.localizedDescription)", statusCode: 400)
                completion(.failure(erroInfo))
                return
            }
            
            if let data = dat {
                do{
                                        
                    let response = try JSONDecoder().decode(FeedResults.self, from: data)
                    albums = response.results.results
                    completion(.success(albums))
                }catch{
                    let error = ErrorInfo(errorCode: .parsingFailed, errorDescription: "PARSING RESPONSE ERROR: \(error.localizedDescription)", statusCode: 500)
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}
