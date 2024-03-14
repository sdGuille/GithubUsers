//
//  UserViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import Foundation
import Observation

@available(iOS 17.0, *)
@Observable
class MainViewModel: ObservableObject {
    var showError = false
    var error: Error? = nil
    var searchText = ""
    var usersArray: [User] = []
    
    let urlString = "https://api.github.com/users"
    
    let service: UserProtocol
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return usersArray }
        return usersArray.filter { $0.login.localizedCaseInsensitiveContains(searchText) }
    }
    
    func handleRefresh() async {
        usersArray.removeAll()
        await loadData()
    }
    
    init(service: UserProtocol) {
        self.service = service
    }
}

@available(iOS 17.0, *)
extension MainViewModel {
    @MainActor
    func loadData() async {
        do {
            let userResponse: [User] = try await service.fetchData(urlString: urlString)
            self.usersArray = userResponse
        } catch {
            self.error = error
        }
    }
}
