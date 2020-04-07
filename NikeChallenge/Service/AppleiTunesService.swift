//
//  AppleiTunesService.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/4/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

protocol GetAlbums {
    func getAlbums(for feed: URL?, completion: @escaping AlbumsCompletionHandler)
}

final class AppleiTunesService: GetAlbums {
    func getAlbums(for feed: URL?, completion: @escaping AlbumsCompletionHandler) {

        guard let url = feed else {
            completion(.failure(ErrorInfo(errorCode: .badUrl, errorDescription: "BAD URL", statusCode: 0)))
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            var statusCode = 500
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            
            if let error = error {
                let erroInfo = ErrorInfo(errorCode: .badRequest, errorDescription: "REQUEST ERROR: \(error.localizedDescription)", statusCode: statusCode)
                completion(.failure(erroInfo))
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(FeedResults.self, from: data)
                    completion(.success(response.results.results))
                } catch {
                    completion(.failure(ErrorInfo(errorCode: .parsingFailed, errorDescription: "PARSING RESPONSE ERROR: \(error.localizedDescription)", statusCode: statusCode)))
                }
            }
        }.resume()
    }
    
}
