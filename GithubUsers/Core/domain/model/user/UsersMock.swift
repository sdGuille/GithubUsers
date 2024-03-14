//
//  UsersMock.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 14/3/24.
//

import Foundation

private struct UsersMock: Codable {
    let users: [User]
}

private func loadData() -> [User] {
    guard let url = Bundle.main.url(
        forResource: "UsersMock",
        withExtension: "json"
    ), let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(UsersMock.self, from: data)
    return jsonMock?.users ?? []
}

extension User {
    static let mock = loadData()
}
