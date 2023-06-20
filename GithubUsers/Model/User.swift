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
    var avatar_url: String
    var repos_url: String
    var type: String
    var site_admin: Bool
    var html_url: String
    
    
    static let example = User(id: 0,
                              login: "guillermo",
                              avatar_url: "https://avatars.githubusercontent.com/u/86071679?v=4",
                              repos_url: "https://api.github.com/users/mojombo/repos",
                              type: "User",
                              site_admin: true,
                              html_url: "none")
}
