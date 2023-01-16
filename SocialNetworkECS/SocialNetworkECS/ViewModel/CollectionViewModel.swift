//
//  CollectionViewModel.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 16/01/23.
//

import Foundation

class CollectionViewModel: ObservableObject {
    @Published var collectionStore: [Collection] = [
        Collection(name: "")
    ]
    
    func addNewCollection(collection: Collection) {
        self.collectionStore.append(collection)
    }
}
