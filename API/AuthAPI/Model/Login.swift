//
//  Login.swift
//  alamofireProject
//
//  Created by Apple on 26/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import Foundation

struct LoginModel: Encodable {
    
    let username: String
    let password: String
}

struct LoginResponseModel {
    let name: String
    let email: String
}

// MARK: - Welcome
struct ResponseModel: Codable {
    let error, message: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username, email: String
    let role, coins, ads, lvl: Int
}
