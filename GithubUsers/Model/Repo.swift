//
//  Repo.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/6/23.
//

import Foundation

struct Repo: Codable, Identifiable {
    let id: Int
    let name: String
    var full_name: String
    let html_url: String
    let description: String?
    let owner: Owner
    let url: String
}

struct Owner: Codable, Identifiable {
    let id: Int
    let login: String
    var avatar_url: String
}
