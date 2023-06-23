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
    let html_url: String
    let description: String?
    let owner: [Owner]
}

struct Owner: Codable, Identifiable {
    let id: Int
    let login: String
}
