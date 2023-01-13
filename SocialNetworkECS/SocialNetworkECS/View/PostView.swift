//
//  PostView.swift
//  SocialNetworkECS
//
//  Created by Edoardo Troianiello on 13/01/23.
//

import SwiftUI

struct PostView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let durationAndDelay : CGFloat = 0.3
    
    let post : Post
    
    
    //MARK: View Body
    var body: some View {
        
        VStack {
            ZStack {
                CardFront(width: width, height: height, degree: $frontDegree, image: post.image)
                CardBack(width: width, height: height, degree: $backDegree, text: post.description)
            }.onTapGesture {
                flipCard ()
            }
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
