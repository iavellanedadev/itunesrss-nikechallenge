//
//  Constants.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/5/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

enum URLMusicFeed: String {
    case oneHundred =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
    case ten =   "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    case twentyFive =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/25/explicit.json"
    case fifty =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    
    var url: URL? {
        URL(string: rawValue)
    }
}

enum Text {
    public static func attributes(_ foregroundColor: UIColor? = nil,
                                  font: UIFont? = nil) -> [NSAttributedString.Key: Any] {
        
        var attributes = [NSAttributedString.Key: Any]()
        
        if let color = foregroundColor {
            attributes.updateValue(color, forKey: .foregroundColor)
        }
        
        if let font = font {
            attributes.updateValue(font, forKey: .font)
        }
        
        return attributes
    }
}
