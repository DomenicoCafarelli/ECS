//
//  UserViewModel.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 12/01/23.
//

import Foundation

class UsersViewModel: ObservableObject{
    
    @Published var userInformationStore: [User] = [

        User(userName: "Domenico Cafarelli", userProfileImageName: "user_1",collections: ["Animations","Buttons","Components"])
    ]
}
