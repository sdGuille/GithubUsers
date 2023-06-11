//
//  Profile.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct Profile: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { picture in
                picture.resizable()
            } placeholder: {
                ProgressView()
            }
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding()
            Text(title)
                .font(.subheadline.bold())
                .padding()
            Spacer()
            
        }
    }
}

#Preview {
    Profile(image: "https://avatars.githubusercontent.com/u/86071679?v=4", title: "sdGuille")
}
