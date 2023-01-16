//
//  CardView.swift
//  SocialNetworkECS
//
//  Created by Edoardo Troianiello on 13/01/23.
//
// swiftlint:disable all


import SwiftUI
import UIKit

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    var image : Image
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .foregroundColor(.red)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    let text : String
    
    @State var text1: String = ""
    @State var buttonText  = "Copy to clipboard"
    @State var buttonColor = Color.gray.opacity(0.2)
    let pasteboard = UIPasteboard.general
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Button {
                    //copy code function
                    
                    copyToClipboard()
                    
                } label: {
                    HStack{
                        Text(buttonText)
                        Image(systemName: "doc.on.doc")
                    }.padding()
                    
                        .background(buttonColor)
                        .cornerRadius(5)
                }
                
                
            }.padding()
            
            Spacer()
            
            Text(text)
            
            Spacer()
            
        }.frame(width: width, height: height)
            .border(.blue)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
    func copyToClipboard() {
        pasteboard.string = self.text
        
        self.buttonText = "Copied!"
        self.buttonColor = Color.green.opacity(0.2)
//        self.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.buttonText = "Copy to clipboard"
            self.buttonColor = Color.gray.opacity(0.2)
        }
}

}
