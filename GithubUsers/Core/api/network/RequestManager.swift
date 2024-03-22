//
//  RequestManager.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 17/3/24.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    init(apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func requestAccessToken() async throws -> String {
        let data = try await apiManager.requestToken()
        
        let token: APIToken = try parser.parse(data: data)
        
        return token.bearerAccessToken
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let authToken = try await requestAccessToken()
        
        let data = try await apiManager.perform(request, authToken: authToken)
        
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
