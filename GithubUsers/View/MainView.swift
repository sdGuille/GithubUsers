//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredUsers) { user in
                NavigationLink(destination: WebProfileView(profileLink: user.html_url)) {
                    ProfileRow(image: user.avatar_url, title: user.login)
                }
            }
            
            .refreshable {
                viewModel.handleRefresh()
            }
            
            .navigationTitle("Github Users")
            .searchable(text: $viewModel.searchText, prompt: "Search Users")
            .task { viewModel.loadData() }
            
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert(
                isPresented: $showAlert,
                content: {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.error?.localizedDescription ?? ""),
                          dismissButton: .default(Text("OK"))
                    )
                }
            )
        }
    }
}


struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct MyAlert {
    
}
