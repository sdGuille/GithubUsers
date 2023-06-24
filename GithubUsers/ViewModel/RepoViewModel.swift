//
//  RepoViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/6/23.
//

import Foundation


class RepoViewModel: ObservableObject {
    @Published var error: Error?
    @Published var repos: [Repo] = []
    
    
    
    var getUrl: String {
        return "https://api.github.com/users/mojombo/repos"
    }
    
    init(){
        loadData()
    }

}

extension RepoViewModel {
    @MainActor
    func fetchRepos() async throws {
        print("🧑🏻‍💻 we are accessing the url \(getUrl)")
        do {
            guard let url = URL(string: getUrl) else { throw CustomError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
            guard let myRepos = try? JSONDecoder().decode([Repo].self, from: data) else { throw CustomError.invalidData }
            self.repos = myRepos
            
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
