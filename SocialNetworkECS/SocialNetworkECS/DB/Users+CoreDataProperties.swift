//
//  Users+CoreDataProperties.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 30/01/23.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var userName: String?
    @NSManaged public var userProfileImageName: String?
    @NSManaged public var collections: [String]?
    @NSManaged public var post: NSSet?

}

// MARK: Generated accessors for post
extension Users {

    @objc(addPostObject:)
    @NSManaged public func addToPost(_ value: Posts)

    @objc(removePostObject:)
    @NSManaged public func removeFromPost(_ value: Posts)

    @objc(addPost:)
    @NSManaged public func addToPost(_ values: NSSet)

    @objc(removePost:)
    @NSManaged public func removeFromPost(_ values: NSSet)

}

extension Users : Identifiable {

}
