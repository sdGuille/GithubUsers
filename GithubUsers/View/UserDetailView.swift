//
//  UserDetailView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 20/6/23.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    @StateObject private var viewModel = RepoViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                CircleImage(image: user.avatar_url)
                    .padding(.top, 100)
                Text(user.login)
                    .font(.largeTitle)
                    .bold()
                Text("Type: \(user.type)")
                    .font(.headline)
                
                Text("User ID: \(user.id)")
                    .font(.headline).bold()
                
                Text(viewModel.description)

                if user.site_admin {
                    Text("Admin")
                } else {
                    Text("Admin: False")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .task {
                viewModel.repoUrl = user.repos_url
                viewModel.loadData()
            }
        }
    }
}

