//
//  PostsViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation

class PostsViewModel: ObservableObject{
    @Published var postStore: [Post] = [
        
        Post(description: "immagine1", imageName: "prova")
    
    ]
}
