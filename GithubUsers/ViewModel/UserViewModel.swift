//
//  UserViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var users = [User]()
    
    var urlString: String {
        return "https://api.github.com/users"
    }
    
    init() {
        loadData()
    }
}

extension MainViewModel {
    @MainActor
    func fetchUsersAsync() async throws {
        guard let url = URL(string: urlString) else {
            print("DEBUG: Invalid URL")
            return
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as?  HTTPURLResponse)?.statusCode == 200 else { return }
        guard let users = try? JSONDecoder().decode([User].self, from: data) else { return }
        self.users = users
        
        
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchUsersAsync()
        }
    }
}
