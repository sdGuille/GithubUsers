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
    @Published var searchText = ""



//    var searchResult: [String] {
////        let results = users.map { $0.login.lowercased() }
////        
////        return searchText == "" ? results : results.filter{ $0.lowercased().contains(searchText) }
//        let myArray = users.map { $0.login.lowercased() }
//        if searchText.isEmpty {
//            return myArray
//        } else {
//            return myArray.filter { $0.lowercased().contains(searchText) }
//        }
//    }
//    
//    func otherSearch() -> [String] {
//        let array = users.map { $0.login.lowercased() }
//        if searchText.isEmpty {
//            return array
//        } else {
//            return array.filter { $0.lowercased().contains(searchText) }
//        }
//    }
    
    
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


extension MainViewModel {
    var filteredUsers: [User] {
        let searchText = self.searchText.lowercased() // Asegúrate de tener una propiedad @Published searchText en tu vista
        
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.login.lowercased().contains(searchText) }
        }
    }
}

