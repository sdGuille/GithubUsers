//
//  ProfileDetailView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 25/9/23.
//

import SwiftUI

struct ProfileDetailView: View {
    @StateObject var viewModel = DetailViewModel(service: UserService())
    var user: User
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            VStack{
                CircleImage(image: viewModel.avatarUrl)
                VStack(alignment: .leading) {
                    VStack {
                        Text(viewModel.name)
                            .font(.title)
                            .foregroundStyle(Color.red)
                            .bold()
                    }
                    .padding()
                    UserInfo(
                        bio: viewModel.bio, company: viewModel.company,
                        location: viewModel.location,
                        followers: "\(viewModel.followers)"
                    )
                }
                .padding()
                Spacer()
                Button(favorites.contains(user: user) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(user: user) {
                        favorites.remove(user)
                    } else {
                        favorites.add(user)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .task {
                viewModel.urlString = user.url
                await viewModel.loadData()
            }
        }
    }
}


