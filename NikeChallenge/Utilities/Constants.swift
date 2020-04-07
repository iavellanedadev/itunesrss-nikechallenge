//
//  Constants.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/5/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

enum URLMusicFeed: String {
    case oneHundred =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
    case ten =   "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    case twentyFive =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/25/explicit.json"
    case fifty =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    
    var url: URL? {
        URL(string: rawValue)
    }
}
