//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var searchText = ""
//    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.users, id: \.self) { user in
                Profile(image: user.avatar_url, title: user.login)
                
            }
            .searchable(text: $viewModel.searchText, prompt: "Search users")
            .navigationTitle("Github Users")
        }
//        .onReceive(viewModel.$error, perform: { error in
//            if error != nil {
//                showAlert.toggle()
//            }
//        })
    }
    
}

struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
