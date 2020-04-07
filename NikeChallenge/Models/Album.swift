//
//  Album.swift
//  NikeChallenge
//
//  Created by Consultant on 4/3/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

struct FeedResults: Codable {
    let results: AlbumResults
    
    private enum CodingKeys: String, CodingKey {
        case results = "feed"
    }
}

struct AlbumResults: Codable {
    let results: [Album]
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

struct Album: Codable {
    var artistName: String
    var releaseDate: String
    var name: String
    var copyright: String
    var artworkUrl100: String
    var genres: [Genre]
    var url: String
}

