//
//  RepoView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 23/6/23.
//

import SwiftUI

struct RepoView: View {
    @StateObject var vm = RepoViewModel()
    let user: String
    
    var body: some View {
        NavigationStack {
            List(vm.repos) { data in
                Text("\(data.name): ")
                    .font(.title2)
                    .bold()
                Text(data.description ?? "No description")
                    .font(.subheadline)
            }
            .navigationTitle(user)
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView(user: "sdGuille")
    }
}
