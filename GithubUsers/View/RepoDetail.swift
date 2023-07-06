//
//  RepoView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 23/6/23.
//

import SwiftUI

struct RepoDetail: View {
    let user: String
    let repos = ["Work on something good", "Working in other thing", "Hello World", "Hello Mami"]
    
    
    var body: some View {
        NavigationStack {
            List(repos, id: \.self) { data in
                Text("\(data): ")
                    .font(.title2)
                    .bold()
                Text(data.description )
                    .font(.subheadline)
            }
            .navigationTitle(user)
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetail(user: "sdGuille")
    }
}
