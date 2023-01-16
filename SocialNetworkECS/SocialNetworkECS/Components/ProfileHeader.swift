//
//  ProfileHeader.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

// swiftlint:disable all

import SwiftUI
import PhotosUI

struct ProfileHeader: View {

    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showingOptions = false
    @State private var selection = "None"
    
    @Binding var user : User

    var body: some View {

        VStack(spacing: 22){

            Button{
                showingOptions = true


            }label: {
                user.userProfileImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }.confirmationDialog("Choose an action", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("View Photo") {
                    selection = "View Photo"

                }
                Button("Choose Photo") {
                    selection = "Choose Photo"
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            Text("Select a photo")
                        }
                    print("edit")
                }

                Button("Delete Photo", role: .destructive) {
                    selection = "Delete Photo"
                }
            }
            Text(user.userName)
        }.font(.title3).bold()
    }
}

//struct ProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeader()
//    }
//}
