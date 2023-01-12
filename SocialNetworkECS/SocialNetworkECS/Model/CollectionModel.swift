//
//  CollectionModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation
import SwiftUI

struct Collections: Identifiable, Hashable{
    let id = UUID()
    var collectionName: String
}
