//
//  UserViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var error: Error?
    
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
        do {
            guard let url = URL(string: urlString) else { throw CustomError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as?  HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
            guard let users = try? JSONDecoder().decode([User].self, from: data) else { throw CustomError.invalidData }
            self.users = users
            
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
