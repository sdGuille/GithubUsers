//
//  CircleImage.swift
//  GithubUsers
//
//  Created by Guillermo Ruiz Baires on 20/6/23.
//

import SwiftUI

struct CircleImage: View {
    var image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { picture in
            picture.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 300, height: 300)
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider{
    static var previews: some View {
        CircleImage(image: "https://avatars.githubusercontent.com/u/86071679?v=4")
    }
}
