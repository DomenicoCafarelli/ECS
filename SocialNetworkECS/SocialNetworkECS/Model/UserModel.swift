//
//  UserModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//
// swiftlint:disable all

import Foundation
import SwiftUI

struct User: Identifiable, Hashable{
    
    let id = UUID()
    var userName: String
    var userProfileImageName: String
    var userProfileImage: Image {
        Image(userProfileImageName)
    }
    var collections: [String]
}
