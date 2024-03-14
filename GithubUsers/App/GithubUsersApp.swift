//
//  GithubUsersApp.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

@main
struct GithubUsersApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                MainView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
