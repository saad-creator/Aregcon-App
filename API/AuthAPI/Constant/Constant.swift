//
//  Constant.swift
//  alamofireProject
//
//  Created by Apple on 26/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import Foundation


let app_id = "AFCC7036-10BA-31C3-FF5D-859DB1DAD800"
let rest_key = "5C75AB8D-AF3F-4040-B783-45F147A4380E"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"
//let register_url = "\(base_url)register"
//let login_url = "\(base_url)login"
let register_url = "https://aregcon.com/pages/api_authentication.php?apicall=signup"
let login_url = "https://aregcon.com/pages/api_authentication.php?apicall=login"
let logout_url = "\(base_url)logout"

struct TokenKey {
    static let userLogin = "USER_LOGIN_KEY"
}
