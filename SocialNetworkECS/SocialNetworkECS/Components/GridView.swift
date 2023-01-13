//
//  GridView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 12/01/23.
//

import SwiftUI

struct GridView: View {
    @StateObject var postViewModel = PostsViewModel()

    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: threeColumnGrid, spacing: 4) {
                    ForEach(postViewModel.postStore) { post in
                        NavigationLink {
                            //                        Future Detail post view
                            PostView(post: post)
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
                    PostView(post: post)
                }
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
