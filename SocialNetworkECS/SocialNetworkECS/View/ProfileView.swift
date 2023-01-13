//
//  ProfileView.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var postsViewModel = PostsViewModel()
    @State var user : User
    
    var body: some View {
        NavigationStack {
            VStack{
                ProfileHeader()

                Spacer()

                CollectionSelection(user: $user)
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

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
