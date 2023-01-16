//
//  PostsViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.

// swiftlint:disable all
//
// swiftlint:disable all

import Foundation

class PostsViewModel: ObservableObject {
    @Published var postStore: [Post] = [
        
        Post(description: "immagine1", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine2", imageName: "prova_1",code: "static var blabla",collections: ["Animations"]),
        Post(description: "immagine3", imageName: "prova_1",code: "static var blabla",collections: ["Components"]),
        Post(description: "immagine4", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine5", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine6", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine7", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine8", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine9", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine10", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine11", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"]),
        Post(description: "immagine12", imageName: "prova_1",code: "static var blabla",collections: ["Animations","Buttons"])
        
        
    ]
    
    func addNewPost(post: Post){
        self.postStore.append(post)
    }
}
