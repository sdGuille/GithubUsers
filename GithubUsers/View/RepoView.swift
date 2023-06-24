//
//  RepoView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 23/6/23.
//

import SwiftUI

struct RepoView: View {
    @StateObject var vm = RepoViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.repos) { data in
                Text(data.name)
                
            }
            .task { vm.loadData() }
            .navigationTitle("Repos")
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}