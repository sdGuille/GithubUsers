//
//  UserInfo.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 25/9/23.
//

import SwiftUI

struct UserInfo: View {
    let bio: String
    let company: String
    let location: String
    let followers: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(bio)
                    .fontWeight(.semibold)
                Text(company)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "location")
                    Text(location)
                        .fontWeight(.medium)
                }
                Text("Followers ❤️ \(followers)")
                    .fontWeight(.semibold)
            }
        }
    }
}
