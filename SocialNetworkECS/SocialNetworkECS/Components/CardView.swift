//
//  CardView.swift
//  SocialNetworkECS
//
//  Created by Edoardo Troianiello on 13/01/23.
//


import SwiftUI

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

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
            //TODO: Reposition
            Image(systemName: "doc.on.doc")
            
            
            Text(text)
                .frame(width: width,height: height)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}


