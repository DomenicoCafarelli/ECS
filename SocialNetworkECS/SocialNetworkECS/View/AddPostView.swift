//
//  AddPostView.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack: some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()

            }){
                    Text("Cancel")
            }
        }
    
    var btnSave: some View { Button(action: {
            //publish the post
            }){
                    Text("Save")
            }
        }

    var body: some View {
        Text("Add the post!")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationBarItems(trailing: btnSave)
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
