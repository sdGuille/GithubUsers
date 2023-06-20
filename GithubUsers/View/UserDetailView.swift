//
//  UserDetailView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 20/6/23.
//

import SwiftUI

struct UserDetailView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var user: User
    
    var userIndex: Int {
        viewModel.filteredUsers.firstIndex(where: { $0.id == user.id })!
    }
    
    var body: some View {
        ScrollView {
            CircleImage(image: user.avatar_url)
                .padding(.top)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static let viewModel = MainViewModel()
    
    static var previews: some View {
        UserDetailView(user: User.example)
            .environmentObject(viewModel)
    }
}
