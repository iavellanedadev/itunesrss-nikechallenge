//
//  APIClientConfigurable.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/4/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

typealias AlbumsCompletionHandler = (_ results: Result<[Album], ErrorInfo>) -> Void

public enum ErrorCode: String {
    case badUrl = "URL_Error_01"
    case badRequest = "Request_Error_01"
    case errorResponse = "Response_Error_01"
    case unknown = "Unknown_Error_01"
    case parsingFailed = "Data_Parsing_error"
}

struct ErrorInfo: Error {
    let errorCode: ErrorCode
    let errorDescription: String?
    let statusCode: Int
}

extension ErrorInfo {
    init(errorDescription: String?) {
        errorCode = .unknown
        self.errorDescription = errorDescription
        statusCode = 400
    }
}
