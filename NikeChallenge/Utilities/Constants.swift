//
//  Constants.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/5/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

enum WebURL: String {
    case base = "https://rss.itunes.apple.com"
    case path = "/api/v1/us/apple-music/top-albums/all/"
    case json = "explicit.json"
    
    static func buildURLWithQueryOf(_ number: Quantity) -> URL? {
        return URL(string: base.rawValue + path.rawValue + "\(number.rawValue)/" + json.rawValue)
    }
}

enum Quantity: Int {
    case ten = 10
    case twentyFive = 25
    case fifty = 50
    case oneHundred = 100
}

extension NSAttributedString {
    public static func makeAttributes(_ foregroundColor: UIColor? = nil,
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

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    static let iTunes: [NSAttributedString.Key : Any] = [
               .foregroundColor: UIColor.white as Any,
               .font: UIFont.boldSystemFont(ofSize: 18) as Any
           ]
}
