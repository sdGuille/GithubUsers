//
//  UserDetailModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/9/23.
//

import Foundation

struct UserDetailModel: Codable, Identifiable {
    var id: Int
    var name: String
    var company: String
    var bio: String?
    var location: String
    var followers: Int
    var avatarUrl: String
}
