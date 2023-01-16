//
//  NewCollectionView.swift
//  SocialNetworkECS
//
//  Created by Maria Smirnova on 16/01/23.
//
// swiftlint:disable all

import SwiftUI

struct NewCollectionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnCancel: some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()

            }){
                    Text("Cancel")
            }
        }
    
    var btnSave: some View { Button(action: {
 
        self.presentationMode.wrappedValue.dismiss()
            }){
                    Text("Add")
            }
        }
    
    @State private var nameTextField: String = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                btnCancel
                Spacer()
                btnSave
            }
            .padding(.all)
            TextField("Add collection name", text: $nameTextField)
                .textFieldModifier(backgroundColor: .gray.opacity(0.2))
            Spacer()
            Spacer()
        }
//        .padding(.vertical)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnCancel)
//        .navigationBarItems(trailing: btnSave)
    }
}

struct NewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NewCollectionView()
    }
}
