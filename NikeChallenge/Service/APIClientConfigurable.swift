//
//  APIClientConfigurable.swift
//  NikeChallenge
//
//  Created by Consultant on 4/4/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ results: Result<Any, ErrorInfo>) -> Void

public enum ErrorCode: String {
    case badUrl = "URL_Error_01"
    case badRequest = "Request_Error_01"
    case errorResponse = "Response_Error_01"
    case unknown = "Unkown_Error_01"
    case parsingFailed = "Data_Parsing_error"
}

struct ErrorInfo: Error {
    var errorCode: ErrorCode = .unknown
    var errorDescription: String?
    var statusCode: Int = 400
    var parsingFailed: ErrorCode = .parsingFailed
}
