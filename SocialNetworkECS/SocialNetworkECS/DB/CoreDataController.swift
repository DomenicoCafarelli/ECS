//
//  CoreDataController.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 30/01/23.
// swiftlint:disable all

import Foundation
import CoreData
import UIKit

class CoreDataController: ObservableObject {
    
    // MARK: - Properties
    
    private let postsEntityName = "Posts"
    private let usersEntityName = "Users"
    private let collectionEntityName = "Collection"
    
    static var shared = CoreDataController()
    
    // MARK: - Initializer
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SocialNetwork")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - CRUD Post Operations

    func createPost(id: UUID, code: String, postDescription: String, imageName: UIImage) -> Posts? {
        let newPost = NSEntityDescription.insertNewObject(forEntityName: postsEntityName, into: context) as? Posts
        newPost?.id = id
        newPost?.code = code
        newPost?.postDescription = postDescription
        newPost?.imageName = imageName.jpegData(compressionQuality: 10)
        save()
        return newPost
    }
    
    func fetchPosts() -> [Posts]? {
        let fetchRequest = NSFetchRequest<Posts>(entityName: postsEntityName)
        return try? context.fetch(fetchRequest)
    }
    
    func updatePosts(user: Posts, newCode: String, newPostDescription: String, newImageName: UIImage) {
        user.code = newCode
        user.postDescription = newPostDescription
        user.imageName = newImageName.jpegData(compressionQuality: 10)
        save()
    }
    
    func deletePost(user: Posts) {
        context.delete(user)
        save()
    }
    
    // MARK: - CRUD User Operations

    func createUser(id: UUID, code: String, userName: String, userProfileImageName: String, collections: [String]) -> Users? {
        let newUser = Users(context: context)
        newUser.id = id
        newUser.userName = userName
        newUser.userProfileImageName = userProfileImageName
        newUser.collections = collections
        save()
        return newUser
    }
    
    func fetchUsers() -> [Users]? {
        let fetchRequest = NSFetchRequest<Users>(entityName: usersEntityName)
        return try? context.fetch(fetchRequest)
    }
    
    func updateUsers(user: Users, newUserName: String, newUserProfileImageName: String, newCollections: [String]) {
        user.userName = newUserName
        user.userProfileImageName = newUserProfileImageName
        user.collections = newCollections
        save()
    }
    
    func deleteUser(user: Users) {
        context.delete(user)
        save()
    }
    
    // MARK: - Helper Methods

    private func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}







