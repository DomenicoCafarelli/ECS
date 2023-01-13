//
//  CollectionsViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation

class CollectionsViewModel: ObservableObject{

    @Published var collectionsStore: [Collections] = [
    Collections(collectionName: "Animations"),
    Collections(collectionName: "Components"),
    Collections(collectionName: "Components")
    ]
}
