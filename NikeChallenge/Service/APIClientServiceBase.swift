//
//  APIClientServiceBase.swift
//  NikeChallenge
//
//  Created by Consultant on 4/4/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

protocol APIClientDecodable {
    func decodeServiceResults <T: Codable> (_ type: T.Type, result:Data?) -> T?
}
extension APIClientDecodable {
    /// function to map any response to Codable type object
    /// - Parameters:
    ///   - type: Generic type of codable object
    ///   - result: using ServiceCallResult block
    public func decodeServiceResults <T: Codable> (_ type: T.Type, result:Data?) -> T? {
        let newJSONDecoder = JSONDecoder()
        guard let dataJSON = result else { return nil }
        do {
            return  try newJSONDecoder.decode(T.self, from: dataJSON)
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
