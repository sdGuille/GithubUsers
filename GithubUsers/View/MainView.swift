//
//  ContentView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var search = ""
    
    var body: some View {
        NavigationView {
            VStack {
            }
            .navigationTitle("Github Users")
            .padding()
        }
    }
}

#Preview {
    MainView()
}
