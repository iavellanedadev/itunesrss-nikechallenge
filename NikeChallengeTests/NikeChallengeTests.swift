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
        // Given
        let url = bundle.url(forResource: mockDataFileName, withExtension: "json")
        var loadedAlbums = [Album]()
        
        // When
        mockAppleiTunesService.getAlbums(for: url) { result in
            switch result {
            case .success(let albums):
                loadedAlbums = albums
            case .failure(let err):
                XCTFail("Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)")
            }
        }
        
        // Then
        XCTAssertGreaterThan(loadedAlbums.count, 10)
    }
    
    /**
     Test our (mock) data fields, and if there is data

     Using this function to test that our mock data (of a single album) has the desired fields,
     we really only need 2 of these here: `album.artistName` and `album.genres`
     */
    func testAlbumDataFields() {
        // Given
        var album: Album?
        
        // When
        if let singleAlbum = mockAppleiTunesService.getSingleAlbum() {
            album = singleAlbum
        }
        else {
            XCTFail("Failed Getting Album")
        }
        
        // Then
        let artistNameLength = album?.artistName.count ?? 0
        let genreCount = album?.genres.count ?? 0
        XCTAssertTrue(artistNameLength > 0)
        XCTAssertGreaterThanOrEqual(genreCount, 1)
    }
    
    /**
     Test our genres count and measure the time it takes to format our string

     Using this function to test
     1. our single album mock `album.genres` containts at least two genre items
     2. measure the time it takes to format our string for displaying the genres
     */
    func testAlbumGenresCount() {
        // Given
        var album: Album?
        
        // When
        if let singleAlbum = mockAppleiTunesService.getSingleAlbum() {
            album = singleAlbum
            measure {
                let _ = album?.genres.prefix(3).map({$0.name}).joined(separator: "/")
            }
        }
        else {
            XCTFail("Failed Getting Album")
        }
        
        // Then
        let genreCount = album?.genres.count ?? 0
        XCTAssertGreaterThanOrEqual(genreCount, 2)
    }
    
    func testViewModelFetch() {
        // Given
        let viewModel = AlbumsViewModel(service: mockAppleiTunesService)
        
        // When
        viewModel.getMusic()
        
        // Then
        XCTAssertGreaterThan(viewModel.count, 10)
    }
    
    func testSingleAlbumViewModel()
    {
        // Given
        let viewModel = AlbumsViewModel(service: mockAppleiTunesService)
        viewModel.getMusic()
        let albumIndex = Int.random(in: 0...10)
        let singleAlbumViewModel = viewModel.makeAlbumViewModel(for: albumIndex)
        
        //When
        let artistName = singleAlbumViewModel.artistName
        let name = singleAlbumViewModel.name
        let genres = singleAlbumViewModel.genres
        let url = singleAlbumViewModel.url
        
        //Then
        let artistNameLength = artistName.count
        XCTAssertGreaterThan(artistNameLength, 0)
        let nameLength = name.count
        XCTAssertGreaterThan(nameLength, 0)
        let isUrl = url?.isFileURL
        XCTAssertNotNil(isUrl)
        let genresLength = genres.count
        XCTAssertGreaterThan(genresLength, 0)

    }
    
    func testImageLoader() {
        //Given
        let testImageFetcher = ImageFetcher()
        var testImage = UIImage()
        
        //When
        if let url = bundle.url(forResource: "placeholdermusic", withExtension:"png")?.absoluteString {
            let _ = testImageFetcher.loadImage(url) { (result) in
                switch result {
                case .success(let image):
                    testImage = image
                case .failure(let error):
                    XCTFail("Failed Loading Image: \(error.localizedDescription)")
                }
            }
        }
        //Then
        XCTAssertNotNil(testImage)
    }
    
}
