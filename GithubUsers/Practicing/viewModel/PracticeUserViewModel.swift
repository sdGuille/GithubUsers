//
//  Practicing.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 13/9/23.
//

import Foundation

protocol UserFetcher {
    func fetchUsers(page: Int) async -> [User]
}

protocol UserStore {
    func save(users: [User]) async throws
}

@MainActor
final class PracticeUserViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var hasMoreUsers = true
    private let userFetcher: UserFetcher
    private let userStore: UserStore
    
    private(set) var page = 1
    
    init(
        isLoading: Bool = true,
        userFetcher: UserFetcher,
        userStore : UserStore
    ) {
        self.isLoading = isLoading
        self.userFetcher = userFetcher
        self.userStore = userStore
    }
    
    func fetchUsers() async {
        isLoading = true
        let users = await userFetcher.fetchUsers(page: page)
        do {
            try await userStore.save(users: users)
        } catch {
            print("Error storing users... \(error.localizedDescription)")
        }
        isLoading = false
        hasMoreUsers = !users.isEmpty
    }
    
    func fetchMoreUsers() async {
        page += 1
        await fetchUsers()
    }
}
