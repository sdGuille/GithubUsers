//
//  ProfileDetailView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 25/9/23.
//

import SwiftUI

struct ProfileDetailView: View {
    @StateObject var viewModel = DetailViewModel()
    var user: User
    
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
                    UserInfo(bio: viewModel.bio, company: viewModel.company,
                             location: viewModel.location,
                             followers: "\(viewModel.followers)")
                }
                .padding()
                Spacer()
            }
            .task {
                viewModel.urlString = user.url
                viewModel.loadData()
            }
        }
    }
}

//#Preview {
//    ProfileDetailView()
//}



