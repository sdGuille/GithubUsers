//
//  ReposView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 22/6/23.
//

import SwiftUI

struct WebProfileView: View {
    let profileLink: String
    
    var body: some View {
        VStack {
            WebView(url: URL(string: profileLink)!)
        }
        
    }
}

struct WebProfileView_Previews: PreviewProvider {
    static var previews: some View {
        WebProfileView(profileLink: "google.com")
    }
}
