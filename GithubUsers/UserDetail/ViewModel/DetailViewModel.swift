//
//  DetailViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/9/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var error: Error?
    @Published var name = ""
    @Published var bio = ""
    @Published var company = ""
    @Published var avatarUrl = ""
    @Published var location = ""
    @Published var followers = 0

    var urlString = ""
    
    

    init() {
        loadData()
    }
}



extension DetailViewModel {
    @MainActor
    func getUserDetail() async throws {
        do {
            guard let url = URL(string: urlString) else { throw CustomError.invalidURL }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(UserDetailModel.self, from: data)
            
            self.name = decoded.name
            self.bio = decoded.bio ?? ""
            self.company = decoded.company
            self.avatarUrl = decoded.avatarUrl
            self.location = decoded.location
            self.followers = decoded.followers
            
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
           try await getUserDetail()
        }
    }
    
    
}
