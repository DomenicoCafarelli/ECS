//
//  CollectionModel.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 16/01/23.
//

import Foundation
import SwiftUI

struct Collection: Identifiable, Hashable {
    var id = UUID()
    var name: String
}
