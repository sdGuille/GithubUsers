//
//  RepoViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/6/23.
//

import Foundation


class RepoViewModel: ObservableObject {
    @Published var error: Error?
    @Published var searchText = ""
    @Published var repos = [Repo]()
    @Published var description = ""
    
    var repoUrl = ""
    
    init(){
        loadData()
    }
}

extension RepoViewModel {
    @MainActor
    func fetchRepos() async throws {
        do {
            guard let url = URL(string: repoUrl) else { throw CustomError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
            guard let returned = try? JSONDecoder().decode(Repo.self, from: data) else { throw CustomError.invalidData }
            self.description = returned.description ?? ""
            
            
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchRepos()
        }
    }
}
