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
        NavigationStack {
            List(viewModel.filteredUsers) { user in
                Profile(image: user.avatar_url, title: user.login)
            }
            .navigationTitle("Github Users")
            .searchable(text: $viewModel.searchText, prompt: "Search Users")
            .task { viewModel.loadData() }
        }
    }
    
}


struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
