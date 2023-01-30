//
//  Posts+CoreDataProperties.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 24/01/23.
//
//

import Foundation
import CoreData

extension Posts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Posts> {
        return NSFetchRequest<Posts>(entityName: "Posts")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var postDescription: String?
    @NSManaged public var imageName: Data?
    @NSManaged public var code: String?
    @NSManaged public var user: Users?

}

extension Posts : Identifiable {

}
