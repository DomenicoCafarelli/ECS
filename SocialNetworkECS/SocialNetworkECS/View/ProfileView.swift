//
//  ProfileView.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
