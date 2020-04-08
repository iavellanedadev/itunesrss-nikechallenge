//
//  AppleiTunesService.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/4/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation
/// Blueprint for our service class
protocol GetAlbums {
    func getAlbums(for feed: URL?, completion: @escaping AlbumsCompletionHandler)
}
/// Our service class for fetching the albums from itunes' rss feed
final class AppleiTunesService: GetAlbums {
    /**
     Get the albums from the itunes rss feed

     Calling this method gets  an `Album` array from JSON fetched.

     - Parameter feed: the URL/endpoint where we are fetching this data from
     */
    func getAlbums(for feed: URL?, completion: @escaping AlbumsCompletionHandler) {

        guard let url = feed else {
            completion(.failure(ErrorInfo(errorCode: .badUrl,
                                          errorDescription: "BAD URL",
                                          statusCode: 0)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            var statusCode = 500
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            
            if let error = error {
                let erroInfo = ErrorInfo(errorCode: .badRequest,
                                         errorDescription: "REQUEST ERROR: \(error.localizedDescription)",
                                         statusCode: statusCode)
                completion(.failure(erroInfo))
                return
            }
            
            guard let data = data else {
                let erroInfo = ErrorInfo(errorCode: .errorResponse,
                                         errorDescription: "NO DATA IN RESPONSE",
                                         statusCode: statusCode)
                completion(.failure(erroInfo))
                return
            }
            do {
                let response = try JSONDecoder().decode(FeedResults.self, from: data)
                completion(.success(response.results.results))
            } catch {
                completion(.failure(ErrorInfo(errorCode: .parsingFailed,
                                              errorDescription: "PARSING RESPONSE ERROR: \(error.localizedDescription)",
                                              statusCode: statusCode)))
            }
        }.resume()
    }
    
}
