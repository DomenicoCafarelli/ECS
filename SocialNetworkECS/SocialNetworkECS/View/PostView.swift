//
//  PostView.swift
//  SocialNetworkECS
//
//  Created by Edoardo Troianiello on 13/01/23.

// swiftlint:disable all
//
// swiftlint:disable all

import SwiftUI

struct PostView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false

    let durationAndDelay : CGFloat = 0.2
    
    let post : Post
    
    
    //MARK: View Body
    var body: some View {
        
        VStack {
            ZStack {
                CardFront(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/1.5, degree: $frontDegree, image: post.image)
                CardBack(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/1.5, degree: $backDegree, text: post.code)
            }.onTapGesture {
                flipCard ()
            }
            Text("From \(post.collections.joined(separator: ",")) collection")
            Text(post.description)
            
            Spacer()
        }
        
    }
    
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
