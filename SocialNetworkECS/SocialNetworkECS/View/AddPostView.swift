//
//  AddPostView.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//
// swiftlint:disable all


//TODO: Needs to be added the photo selection for the post, right now it creates a post with hard coded image.

import SwiftUI

struct AddPostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var postsViewModel : PostsViewModel
    @EnvironmentObject var userViewModel : UsersViewModel

    var btnBack: some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()

            }){
                    Text("Cancel")
            }
        }
    
    var btnSave: some View { Button(action: {
            //publish the post
        //TODO: posterUsername is hardcoded needs to be passed to this view in oreder to create the post relative to a specific user
        var post = Post(description: addDescrField, imageName: "", code:  codeTextField, collections: ["Animations", "Buttons"])
        self.postsViewModel.addNewPost(post: post)
        self.presentationMode.wrappedValue.dismiss()
            }){
                    Text("Save")
            }
        }
    var btnAddCollect: some View { Button(action: {
        //add collection
    }){
        Image(systemName: "plus")
            .padding(.all, 10)
            .foregroundColor(.black)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
    }
    
    @State private var codeTextField: String = ""
    @State private var addDescrField: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Put your code here...", text: $codeTextField)
                .frame(height: 400.0)
                .textFieldModifier(backgroundColor: .gray.opacity(0.2))
//            Spacer()
            TextField("Add a description...", text: $addDescrField)
                .textFieldModifier(backgroundColor: .gray.opacity(0.2))
            Spacer()
            Text("Collection")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.leading)
//            Spacer()
            HStack {
                btnAddCollect
            }
            .padding()
            Spacer()
        }
        .padding(.vertical)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationBarItems(trailing: btnSave)
    }
}

struct TextFieldModifier: ViewModifier {
//    let fontSize: CGFloat
    let backgroundColor: Color
//    let textColor: Color

    func body(content: Content) -> some View {
        content
//            .font(Font.system(size: fontSize))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
//            .foregroundColor(textColor)
            .padding()
    }
}

extension View {
    func textFieldModifier(backgroundColor: Color = .gray) -> some View {
        self.modifier(TextFieldModifier( backgroundColor: backgroundColor))
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
