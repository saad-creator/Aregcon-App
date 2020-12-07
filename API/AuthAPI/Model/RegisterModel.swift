//
//  RegsiterModel.swift
//  alamofireProject
//
//  Created by Apple on 26/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import Foundation

struct RegisterModel: Encodable {
    
    //    let name: String
    //    let email: String
    //    let password: String
    
    let username: String
    let email: String
    let password: String
    let role: String
}




//// MARK: - Welcome
//struct ResponseModel: Codable {
//    let lastLogin: Int
//    let userStatus, socialAccount: String
//    let created: Int
//    let name, email, blUserLocale: String
////    let updated: JSONNull?
//    let objectID, ownerID, welcomeClass, userToken: String
//
//    enum CodingKeys: String, CodingKey {
//        case lastLogin, userStatus, socialAccount, created, name, email, blUserLocale
//        case objectID = "objectId"
//        case ownerID = "ownerId"
//        case welcomeClass = "___class"
//        case userToken = "user-token"
//    }
//}
