//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct MainView: View {
    @Bindable var mainViewModel = MainViewModel(service: UserService())
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
            .task {
                await mainViewModel.loadData()
                if mainViewModel.error != nil {
                    mainViewModel.showError = true
                }
            }
            .alert(
                isPresented: $mainViewModel.showError,
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
        if #available(iOS 17.0, *) {
            MainView()
        } else {
            // Fallback on earlier versions
        }
    }
}
