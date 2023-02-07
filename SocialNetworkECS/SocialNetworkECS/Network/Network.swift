//
//  Network.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 23/01/23.
//
// swiftlint:disable all


import Foundation
import Combine

class Network: NSObject {
    
    //MARK: from Mimmo's tutorial
    
    var posts: [Post] = []
    
//    func fetchPosts(completionHandler: @escaping ([Post]) -> Void) {
//        var urlComponent = URLComponents(string: "http://localhost:8080/postsJson")
//
//      let task = URLSession.shared.dataTask(with: urlComponent, completionHandler: { (data, response, error) in
//        if let error = error {
//          print("Error with fetching films: \(error)")
//          return
//        }
//
//        guard let httpResponse = response as? HTTPURLResponse,
//              (200...299).contains(httpResponse.statusCode) else {
//          print("Error with the response, unexpected status code: \(response)")
//          return
//        }
//
//        if let data = data,
//          let postSummary = try? JSONDecoder().decode(PostSummary.self, from: data) {
//          completionHandler(postSummary.results ?? [])
//        }
//      })
//      task.resume()
//    }
    
//    private func fetchPost(withID id:Int, completionHandler: @escaping (Post) -> Void) {
//        var urlComponent = URLComponents(string: "http://localhost:8080/postsJson")
//
//      let task = URLSession.shared.dataTask(with: urlComponent) { (data, response, error) in
//        if let error = error {
//          print("Error returning film id \(id): \(error)")
//          return
//        }
//
//        guard let httpResponse = response as? HTTPURLResponse,
//          (200...299).contains(httpResponse.statusCode) else {
//          print("Unexpected response status code: \(response)")
//          return
//        }
//
//        if let data = data,
//          let post = try? JSONDecoder().decode(Post.self, from: data) {
//            completionHandler(post)
//        }
//      }
//      task.resume()
//    }
    
    //MARK: original
    
    /// Create a single instance on Network class
    static let shared = Network()
    
    /// Create a urlSession object, use this to perform requests
    let session: URLSession = URLSession(configuration: .default)
    
    /// URLComponents, use this to create and manipulate endpoints
    var urlComponent = URLComponents(string: "http://localhost:8080/postsJson")
    
    /// Decoder for JSON `Data`.
    lazy var decoder = JSONDecoder()
    
    /// Encoder for JSON `Data`.
    lazy var encoder = JSONEncoder()
    
    func list(path: String) -> AnyPublisher<[Post], NetworkError> {
        let request = buildRequest(
            method: "GET",
            path: path
        )
        return perform(request: request, decoder: decodePosts(from:))
    }
 
    func create(path: String, post: CreatePost) -> AnyPublisher<Post, NetworkError> {
        
        let request = buildRequest(
            method: "POST",
            path: path,
            body: post
        )
        return perform(request: request, decoder: decodePost(from:))
    }
    
    func update(path: String, with newPost: Post) -> AnyPublisher<Post, NetworkError> {
        
        let request = buildRequest(
            method: "PUT",
            path: path,
            body: newPost
        )
        
        return perform(request: request, decoder: decodePost(from:))
    }
    
    func delete(path: String) -> AnyPublisher<Bool, NetworkError> {
        
        let request = buildRequest(
            method: "DELETE",
            path: path
        )
        return perform(request: request, decoder: decodeBool(from:))
    }
}
