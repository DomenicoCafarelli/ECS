//
//  ProfileHeader.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

import SwiftUI
import PhotosUI

struct ProfileHeader: View {

    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showingOptions = false
    @State private var selection = "None"

    var body: some View {

        VStack(spacing: 22){

            Button{
                showingOptions = true
            }label: {
                Image("prova_1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }.confirmationDialog("Choose an action", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("View Photo") {
                    selection = "View Photo"
                }
                Button("Edit Photo") {
                    selection = "Edit Photo"
                    print("edit")
                }
                Button("Delete Photo", role: .destructive) {
                    selection = "Delete Photo"
                }
            }
            Text("Domenico Cafarelli")
        }.font(.title3).bold()
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
// Code for the photo picker
//            PhotosPicker(
//                selection: $selectedItem,
//                matching: .images,
//                photoLibrary: .shared()) {
//                    Text("Select a photo")
//                }
