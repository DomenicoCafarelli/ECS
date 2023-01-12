//
//  PostsViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var postStore: [Post] = [
        
        Post(description: "immagine1", imageName: "prova_1"),
        Post(description: "immagine2", imageName: "prova_2"),
        Post(description: "immagine3", imageName: "prova_3"),
        Post(description: "immagine4", imageName: "prova_4"),
        Post(description: "immagine5", imageName: "prova_5"),
        Post(description: "immagine6", imageName: "prova_6")
    
    ]
}
