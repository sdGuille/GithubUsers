//
//  Profile.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 10/6/23.
//

import SwiftUI

struct ProfileRow: View {
    let image: String
    let title: String
    var body: some View {
        
        ZStack {
            VStack {
                
                HStack {
                    AsyncImage(url: URL(string: image)) { picture in
                        picture.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 2)
                    .padding()
                    Text(title)
                        .font(.title3)
                        .fontWeight(.regular)
                        .padding(.top)
                }
            }
        }
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(image: "https://avatars.githubusercontent.com/u/86071679?v=4",
                   title: "sdGuille"
        )
        .previewLayout(.sizeThatFits)
    }
}
