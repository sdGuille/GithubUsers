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
    private let gridItems = [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 8)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: gridItems, content: {
                        ForEach(viewModel.filteredUsers) { user in
                            NavigationLink {
                                ProfileDetailView(user: user)
                            } label: {
                                ProfileRow(image: user.avatar_url, title: user.login)
                            }
                        }
                    })
                    .padding()
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
    }
}


struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
