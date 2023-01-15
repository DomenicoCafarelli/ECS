//
//  GridView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 12/01/23.
//
// swiftlint:disable all

import SwiftUI

struct GridView: View {
    @State var posts : [Post]
    
    // needed to change the private here, it caused the init to be inaccessible.
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    

    var body: some View {
        NavigationStack {
                LazyVGrid(columns: threeColumnGrid, spacing: 4) {
                    ForEach(posts) { post in
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

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
