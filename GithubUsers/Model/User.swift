//
//  User.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var login: String
    var avatar_url: String
    var repos_url: String
    var type: String
    var site_admin: Bool
    var html_url: String
}
