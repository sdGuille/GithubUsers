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
                Text(title)
                    .foregroundStyle(.white, .yellow)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding(.top)
                    Spacer()
                HStack {
                    AsyncImage(url: URL(string: image)) { picture in
                        picture.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                        .frame(width: 95, height: 95)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 1)
                        }
                        .shadow(radius: 2)
                        .padding()
                }
                Spacer()
            }
            .frame(width: 165, height: 150)
            .background(
            RoundedRectangle(cornerRadius: 25.0))
            .foregroundStyle(.regularMaterial)
            .shadow(radius: 10)
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
