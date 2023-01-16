//
//  FeedView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 13/01/23.
//
// swiftlint:disable all


import SwiftUI

struct FeedView: View {
    
    @EnvironmentObject var postViewModel: PostsViewModel
    @State var post : Post
    var body: some View {
        ScrollViewReader { value in
            ScrollView() {
                ForEach(postViewModel.postStore) { post in
                    PostView(post: post)
                        .id(post.description)
                }
            }
            .onAppear {
                value.scrollTo(post.description)
            }
            
        }
    }
}


//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
