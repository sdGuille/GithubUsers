//
//  AuthTokenRequest.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 20/3/24.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
    var header: [String : String] {
        ["HEllo World": "Wefasf"]
    }
    
    case auth
    
    var path: String {
        "/v2/oauth2/token"
    }
    
    var params: [String : Any] {
        [
            "grant_type": APIConstants.grantType,
            "client_id": APIConstants.clientId,
            "client_secret": APIConstants.clientSecret
            
        ]
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .POST
    }
}
