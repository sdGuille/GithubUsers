//
//  RepoView.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 21/6/23.
//

import SwiftUI
import WebKit

struct RepoView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                URLRequest(url: url)
                
            }
        }
    }
}


struct DetailView: View {
    let url: String?
    
    var body: some View {
        RepoView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    let user: User
    
    static var previews: some View {
        DetailView(url: "https://api.github.com/users/mojombo/repos")
    }
}
