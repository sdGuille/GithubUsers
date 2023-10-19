//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel(service: UserService())
    @State private var showAlert = false
    private let gridItems = [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 8)]
    @StateObject var favorites = Favorites()
    
    var body: some View {
        NavigationStack {
                VStack {
                        List(mainViewModel.filteredUsers) { user in
                            NavigationLink {
                                ProfileDetailView(user: user)
                            } label: {
                                HStack {
                                    ProfileRow(image: user.avatarUrl, title: user.login)
                                    Spacer()
                                    if favorites.contains(user: user) {
                                        Image(systemName: "heart.fill")
                                            .accessibilityLabel("This is a favorite user")
                                            .foregroundStyle(.red)
                                    }
                                }
                            }
                        }
                }
                .refreshable {
                    await mainViewModel.handleRefresh()
                }
                .navigationTitle("Github Users")
                .searchable(text: $mainViewModel.searchText, prompt: "Search Users")
                .task { await mainViewModel.loadData() }
                .onReceive(mainViewModel.$error, perform: { error in
                    if error != nil {
                        showAlert.toggle()
                    }
                })
                .alert(
                    isPresented: $showAlert,
                    content: {
                        Alert(title: Text("Error"),
                              message: Text(mainViewModel.error?.localizedDescription ?? ""),
                              dismissButton: .default(Text("OK"))
                        )
                    }
                )
        }
        .environmentObject(favorites)
    }
}


struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
