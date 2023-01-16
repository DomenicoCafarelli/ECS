//
//  GridView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 12/01/23.
//
// swiftlint:disable all

//TODO: future implementation: show only the posts relative to a specific user. show only the posts relative to a specific collection (we should pass the selected collection from the parent view)

import SwiftUI

struct GridView: View {
    @EnvironmentObject var postsViewModel : PostsViewModel
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    

    var body: some View {
        ScrollViewReader { proxy in
        NavigationStack {
                LazyVGrid(columns: threeColumnGrid, spacing: 4) {
                    
                    ForEach(postViewModel.postStore) { post in
                         
                            NavigationLink {
                                //                        Future Detail post view
    //                            PostView(post: post)
                                FeedView()
                                
                                
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
                }
                .navigationDestination(for: Post.self) { post in
                    PostView(post: post)
                }
            
        }
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
