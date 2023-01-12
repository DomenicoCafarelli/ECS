//
//  CollectionSelection.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import SwiftUI

struct CollectionSelection: View {
    @StateObject var collectionsViewModel = CollectionsViewModel()

    var backgroundColorCollectionButtons = Color(red: 223.0/255, green: 223.0/255, blue: 223.0/255)

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 22){
                ForEach(collectionsViewModel.collectionsStore){ collection in

                    Button {
                        // action code
                    } label: {

                        Text(collection.collectionName)
                            .foregroundColor(.black)
                            .frame(width: 140, height: 30)
                            .background(backgroundColorCollectionButtons)
                            .cornerRadius(5)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct CollectionSelection_Previews: PreviewProvider {
    static var previews: some View {
        CollectionSelection()
    }
}
