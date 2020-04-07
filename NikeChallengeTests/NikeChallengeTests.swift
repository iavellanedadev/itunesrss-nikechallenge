//
//  NikeChallengeTests.swift
//  NikeChallengeTests
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import XCTest
@testable import NikeChallenge

class NikeChallengeTests: XCTestCase {
    var mockAppleiTunesService: MockAppleiTunesService!
    var mockDataFileName: String!
    let bundle = Bundle(for:NikeChallengeTests.self)

    
    override func setUpWithError() throws {
        mockAppleiTunesService = MockAppleiTunesService()
        mockDataFileName = "mockFeedData"
    }
    
    /**
     Test our (mock) data count!

     Using this function to test that our mock data count has the appropriate size,
     the mockdata is set to 38, all we want to ensure is that there at more than 10 items
     */
    func testFetchDataCount() {
        let url = self.bundle.url(forResource: mockDataFileName, withExtension: "json")
        mockAppleiTunesService.getAlbums(for: url){ result in
            switch result {
            case .success(let albums):
                XCTAssertGreaterThan(albums.count, 10)
                
            case .failure(let err):
                XCTFail("Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)")
            }
        }
    }
    
    /**
     Test our (mock) data fields, and if there is data

     Using this function to test that our mock data (of a single album) has the desired fields,
     we really only need 2 of these here: `album.artistName` and `album.genres`
     */
    func testAlbumDataFields() {

        if let album = mockAppleiTunesService.getSingleAlbum() {
            
            XCTAssertTrue(album.artistName.count > 0)
            XCTAssertGreaterThanOrEqual(album.genres.count, 1)
        }
        else{
            XCTFail("Failed Getting Album")
        }

    }
    
    /**
     Test our genres count and measure the time it takes to format our string

     Using this function to test
     1. our single album mock `album.genres` containts at least two genre items
     2. measure the time it takes to format our string for displaying the genres
     */
    func testAlbumGenresCount() {
        if let album = mockAppleiTunesService.getSingleAlbum() {
            
            XCTAssertGreaterThanOrEqual(album.genres.count, 2)
            measure {
                let _ = album.genres.prefix(3).map({$0.name}).joined(separator: "/")
            }
        }
        else{
            XCTFail("Failed Getting Album")
        }
    }
/// Our mock service class for testing, we want to use our mock data, conform to our `GetAlbums` protocol and use this class for testing out business logic, without worrying about a backend being down or having latency issues that can affect our assertions unpredictably
    class MockAppleiTunesService: GetAlbums {

        var mockDataFileName = "mockFeedData"
        let bundle = Bundle(for:NikeChallengeTests.self)
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
        func getSingleAlbum() -> Album?
        {
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
}
