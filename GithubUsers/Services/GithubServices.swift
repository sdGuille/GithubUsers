//
//  GithubUserServices.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 7/10/23.
//

import Foundation

protocol UserProtocol {
    func fetchData<T: Codable>(urlString: String) async throws -> T
}

class UserService: UserProtocol {
    func fetchData<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw CustomError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
        
        do {
            let user = try JSONDecoder().decode(T.self, from: data)
            return user
        } catch {
            throw CustomError.invalidData
        }
    }
}