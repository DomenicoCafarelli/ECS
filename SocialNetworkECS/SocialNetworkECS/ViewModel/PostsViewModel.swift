//
//  PostsViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.

// swiftlint:disable all
//
// swiftlint:disable all

import Foundation
import Combine

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
    
    //MARK: Network stuff
    
    private let postPath = "/postsJson"
    private var observers: Set<AnyCancellable> = []
    
    func getPosts() {
        Network.shared.list(path: postPath)
            .sink {
                completion in
                switch completion {
                case .failure(let error):
                    let error = ResponseHandler.shared.mapError(error)
                    print(error.localizedDescription)
                case .finished:
                    print("\(#function) success")
                }
            } receiveValue: { [weak self] data in
                print(data)
                self?.postStore = data
            }
            .store(in: &observers)
    }
    
    func create(description: String, imageName: String, code: String) {
        let parsedPost = CreatePost(description: description, imageName: imageName, code: code, collections: [])
        
        Network.shared.create(path: postPath,
                              post: parsedPost)
            .sink {
                completion in
                switch completion {
                case .failure(let error):
                    let error = ResponseHandler.shared.mapError(error)
                    print(error.localizedDescription)
                case .finished:
                    print("\(#function) success")
                }
            } receiveValue: { [weak self] data in
                self?.postStore.insert(data, at: 0)
            }
            .store(in: &observers)
    }
    
    func update(by id: UUID, with newPost: Post) {
        Network.shared.update(path: postPath.appending("/\(id)"), with: newPost)
            .sink {
                completion in
                switch completion {
                case .failure(let error):
                    let error = ResponseHandler.shared.mapError(error)
                    print(error.localizedDescription)
                case .finished:
                    print("\(#function) success")
                }
            } receiveValue: { [weak self] data in
                if let row = self?.postStore.firstIndex(where: { $0.id == id }) {
                    self?.postStore[row] = data
                }
            }
            .store(in: &observers)
    }
    
    func delete(post: Post) {
        Network.shared.delete(path: postPath.appending("/\(post.id)"))
            .sink {
                completion in
                switch completion {
                case .failure(let error):
                    let error = ResponseHandler.shared.mapError(error)
                    print(error.localizedDescription)
                case .finished:
                    print("\(#function) success")
                }
            } receiveValue: { [weak self] data in
                if data,
                   let row = self?.postStore.firstIndex(where: { $0.id == post.id }) {
                    self?.postStore.remove(at: row)
                }
            }
            .store(in: &observers)
    }
}
