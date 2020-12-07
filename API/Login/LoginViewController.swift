//
//  LoginViewController.swift
//  API
//
//  Created by Apple on 29/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailForLogin: UITextField!
    @IBOutlet weak var passwordForLogin: UITextField!
    @IBOutlet weak var loginFailedMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginFailedMessage.text = ""
        
        hideKeyboardWhenTappedAround()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func loginButtonTabbed(_ sender: Any) {
        loginFailedMessage.text = ""
        
        
        guard let loginEmail = emailForLogin.text else {return}
        guard let loginPassword = passwordForLogin.text else {return}
        
        let loginModel = LoginModel(username: loginEmail, password: loginPassword)
        APIManager.shareInstance.callingLoginAPI(login: loginModel) { (result) in
            
            switch result {
            case .success(let json):
                print(json as Any)
                self.dismissKeyboard()
                
                print("It is successful")
                
                let name = (json as! ResponseModel).user.username
                let _ = (json as! ResponseModel).user.email
                let userId = String((json as! ResponseModel).user.id)
                TokenService.tokenInstance.saveToken(token: userId)
                
                let DashboardVC = DashboardViewController.shareInstance()
                DashboardVC.strName = name
                self.navigationController?.pushViewController(DashboardVC, animated: true)
               
                let email = (json as AnyObject).value(forKey: "email") as! String
                let names  = (json as AnyObject).value(forKey: "name") as! String
                let loginModelResponse = LoginResponseModel(name: names, email: email)
                print(loginModelResponse)
                
            case .failure(let err):
                self.dismissKeyboard()
                DispatchQueue.main.async {
                    if err.localizedDescription.description != "" {
                        self.loginFailedMessage.text = "\(err.localizedDescription)"
                        
                    } else {
                        self.loginFailedMessage.text = "\(err.localizedDescription)"
                    }
                }
                print(err.localizedDescription)
            }
        }
    }
}

extension LoginViewController {
    static func shareInstance() -> LoginViewController {
        return LoginViewController.instantiateFromStoryboard("Main")
    }
    
}


