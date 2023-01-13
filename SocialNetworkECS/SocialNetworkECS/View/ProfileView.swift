//
//  ProfileView.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var postsViewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ProfileHeader()

                Spacer()

                CollectionSelection()
                    .padding(.top, 60)

                Spacer()

                Text("\(postsViewModel.postStore.count)   Posts")
                    .padding(.top, 30)
                

                Spacer()

                GridView()
                    .padding(.top, 40)
            }
            .toolbar {
                NavigationLink(destination: AddPostView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
