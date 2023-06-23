//
//  UserViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var error: Error?
    @Published var searchText = ""
    @Published var myUsers: [User] = []
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return myUsers }
        return myUsers.filter { $0.login.localizedCaseInsensitiveContains(searchText) }
    }

    var urlString: String {
        return "https://api.github.com/users"
    }
    
    init() {
        loadData()
    }
    
    func handleRefresh() {
        myUsers.removeAll()
        loadData()
    }
}

extension MainViewModel {
    @MainActor
    func fetchUsersAsync() async throws {
        do {
            guard let url = URL(string: urlString) else { throw CustomError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as?  HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
            guard let users = try? JSONDecoder().decode([User].self, from: data) else { throw CustomError.invalidData }
            self.myUsers = users
            
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchUsersAsync()
        }
    }
}
