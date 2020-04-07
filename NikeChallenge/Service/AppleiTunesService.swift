//
//  AppleiTunesService.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/4/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

protocol GetAlbums {
    func getAlbums(completion: @escaping CompletionHandler)
}

final class AppleiTunesService: GetAlbums {
    func getAlbums(completion: @escaping CompletionHandler) {

        guard let url = URL(string: Constants.URL_MUSIC_FEED_100) else {
            let error = ErrorInfo(errorCode: .badUrl, errorDescription: "BAD URL", statusCode: 0)
            completion(.failure(error))
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                let erroInfo = ErrorInfo(errorCode: .badRequest, errorDescription: "REQUEST ERROR: \(error.localizedDescription)", statusCode: 400)
                completion(.failure(erroInfo))
                return
            }
            
            if let data = data {
                do {
                                        
                    let response = try JSONDecoder().decode(FeedResults.self, from: data)
                    completion(.success(response.results.results))
                } catch {
                    completion(.failure(ErrorInfo(errorCode: .parsingFailed, errorDescription: "PARSING RESPONSE ERROR: \(error.localizedDescription)", statusCode: 500)))
                }
            }
        }.resume()
    }
    
}
