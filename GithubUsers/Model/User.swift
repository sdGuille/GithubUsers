//
//  User.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

struct User: Codable {
    var id: Int
    var login: String
    var avatar_url: String
    var repos_url: String
}
