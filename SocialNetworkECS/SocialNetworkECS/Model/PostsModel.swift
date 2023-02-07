//
//  PostsModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//
// swiftlint:disable all

import Foundation
import SwiftUI
import CoreData

struct Post: Identifiable, Hashable, Codable {
    var id = UUID()
    var description: String
    var imageName: String
    var code: String
    var image: Image {
        Image(imageName)
    }
    var collections : [String]
//    var userId : UUID
}

struct CreatePost: Codable {
    var description: String
    var imageName: String
    var code: String
    var image: Image {
        Image(imageName)
    }
    var collections : [String]
}

struct PostSummary: Codable {
  let count: Int?
  let results: [Post]?
}
