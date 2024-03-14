//
//  CustomError.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

public enum CustomError: LocalizedError {
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
                
            case .invalidServerResponse:
                return "The server returned an invalid response"
            case .invalidURL:
                return "URL string is malformed."
        }
    }
}
