//
//  DetailViewModel.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/9/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var error: CustomError?
    @Published var name = ""
    @Published var bio = ""
    @Published var company = ""
    @Published var avatarUrl = ""
    @Published var location = ""
    @Published var followers = 0
    
    
    var urlString = ""
    let service: UserProtocol
    
    

    init(service: UserProtocol) {
        self.service = service
    }
}

extension DetailViewModel {
    @MainActor
    func loadData() async {
        do {
            let userDeatilResponse: UserDetailModel = try await service.fetchData(urlString: urlString)

            
            self.name = userDeatilResponse.name
            self.bio = userDeatilResponse.bio ?? "N/A"
            self.company = userDeatilResponse.company
            self.avatarUrl = userDeatilResponse.avatarUrl
            self.location = userDeatilResponse.location
            self.followers = userDeatilResponse.followers
        } catch {
            self.error = error as? CustomError
        }
    }
}


