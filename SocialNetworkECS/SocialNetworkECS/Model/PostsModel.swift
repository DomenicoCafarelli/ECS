//
//  PostsModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation
import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID()
    var description: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
