//
//  GridView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 12/01/23.
//

import SwiftUI

struct GridView: View {
    @StateObject var postViewModel = PostsViewModel()
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)]) {
                ForEach(postViewModel.postStore) { post in
                    NavigationLink {
//                        Future Detail post view
                        Text(post.description)
                    } label: {
                        post.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
            .navigationDestination(for: Post.self) { post in
                Text(post.description)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
