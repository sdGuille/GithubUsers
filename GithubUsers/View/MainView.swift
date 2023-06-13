//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    Profile(image: user.avatar_url, title: user.login)
                    
                    
                }
                
            }
//            .searchable(text: $viewModel.searchText, prompt: "Search users")
            .navigationTitle("Github Users")
            
        }
    }
    
}

#Preview {
    MainView()
}
