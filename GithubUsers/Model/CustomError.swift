//
//  CustomError.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

enum CustomError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknow
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid, please try again later."
        case .serverError:
            return "There was an error with the server. Please try again later."
        case .invalidData:
            return "The user data is invalid. Please try again later."
        case .unknow:
            return localizedDescription
        }
    }
}
