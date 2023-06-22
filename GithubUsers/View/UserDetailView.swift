//
//  UserDetailView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 20/6/23.
//

import SwiftUI

struct UserDetailView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode
    var user: User
    
    var userIndex: Int {
        viewModel.filteredUsers.firstIndex(where: { $0.id == user.id })!
    }
    
    var body: some View {
        
        ZStack {
            Color.gray
                .ignoresSafeArea(.all)
            ScrollView {
                CircleImage(image: user.avatar_url)
                    .padding(.top, 100)
                // User
                Text(user.login)
                    .font(.largeTitle)
                    .bold()
                Text("Type: \(user.type)")
                    .font(.headline)
                
                if user.site_admin {
                    Text("Admin")
                } else {
                    Text("Admin: False")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
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
