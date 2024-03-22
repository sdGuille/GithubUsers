//
//  APIManager.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 17/3/24.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
    func requestToken() async throws -> Data
}

class APIManager: APIManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String = "") async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw CustomError.invalidServerResponse
        }
        return data
    }
    
    func requestToken() async throws -> Data {
        try await perform(AuthTokenRequest.auth)
    }
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}
