//
//  NikeChallengeTests.swift
//  NikeChallengeTests
//
//  Created by Consultant on 4/7/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import XCTest
@testable import NikeChallenge

class NikeChallengeTests: XCTestCase {
    var mockAppleiTunesService: MockAppleiTunesService!

    override func setUpWithError() throws {
        mockAppleiTunesService = MockAppleiTunesService()
    }
    
    func testFetchDataCount()
    {
        mockAppleiTunesService.getAlbums{ result in
            switch result {
            case .success(let music):
                guard let albums = music as? [Album] else {return}
                XCTAssertGreaterThan(albums.count, 10)
            case .failure(let err):
                XCTFail("Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)")
            }
        }
    }
    
    func testAlbumDataFields(){

        if let album = mockAppleiTunesService.getSingleAlbum() {
            
            XCTAssertTrue(album.artistName.count > 0)
            XCTAssertGreaterThanOrEqual(album.genres.count, 1)
        }
        else{
            XCTFail("Failed Getting Album")
        }

    }
    
    func testAlbumGenresCount()
    {
        if let album = mockAppleiTunesService.getSingleAlbum() {
            
            XCTAssertGreaterThanOrEqual(album.genres.count, 2)
            measure {
                album.genres.prefix(3).map({$0.name}).joined(separator: "/")
            }
        }
        else{
            XCTFail("Failed Getting Album")
        }
    }

    class MockAppleiTunesService: GetAlbums{

        var mockDataFileName = "mockFeedData"
        let bundle = Bundle(for:NikeChallengeTests.self)

        func getAlbums(completion: @escaping CompletionHandler) {
            if let url =  bundle.url(forResource: mockDataFileName, withExtension: "json") {
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
