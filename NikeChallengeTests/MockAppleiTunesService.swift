//
//  MockAppleiTunesService.swift
//  NikeChallengeTests
//
//  Created by Consultant on 4/8/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import XCTest
@testable import NikeChallenge

/// Our mock service class for testing, we want to use our mock data, conform to our `GetAlbums` protocol and use this class for testing out business logic, without worrying about a backend being down or having latency issues that can affect our assertions unpredictably
class MockAppleiTunesService: GetAlbums {
    var mockDataFileName = "mockFeedData"
    let bundle = Bundle(for: NikeChallengeTests.self)
    /**
     Get the albums from the itunes rss feed
     
     Calling this method gets  an `Album` array from JSON fetched.
     
     - Parameter feed: the URL/endpoint where we are fetching this data from (in this case our main bundle)
     */
    func getAlbums(for feed: URL?, completion: @escaping AlbumsCompletionHandler) {
        
        if let url = bundle.url(forResource: mockDataFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                let response = try JSONDecoder().decode(FeedResults.self, from: data)
                completion(.success(response.results.results))
            } catch {
                let error = ErrorInfo(errorCode: .parsingFailed, errorDescription: "PARSING RESPONSE ERROR: \(error.localizedDescription)", statusCode: 500)
                completion(.failure(error))
            }
        }
    }
    /**
     Get a single album!
     
     Calling this method gets  an `Album` array from mock JSON stored locally
     */
    func getSingleAlbum() -> Album? {
        if let url =  bundle.url(forResource: "mockAlbumData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                let response = try JSONDecoder().decode(Album.self, from: data)
                return response
            } catch {
                print("Error Parsing Json")
                return nil
            }
        }
        return nil
    }
}
