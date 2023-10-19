//
//  User.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: Int
    var login: String
    var avatarUrl: String
    var reposUrl: String
    var type: String
    var siteAdmin: Bool
    var url: String
}
