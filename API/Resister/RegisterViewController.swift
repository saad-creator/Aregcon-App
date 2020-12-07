//
//  RegisterViewController.swift
//  alamofireProject
//
//  Created by Apple on 26/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func haveAnAccount(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var regRole: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let fname = self.firstName.text else {return}
        guard let lname = self.lastName.text else {return}
        guard let email = self.emailField.text else {return}
        guard let password = self.passwordField.text else {return}
        guard let role = self.regRole.text else {return}
        
        let register = RegisterModel(username: "\(fname) \(lname)", email: email, password: password, role: role)
        APIManager.shareInstance.callingRegisterAPI(register: register) { (isSuccess, str)  in
            if isSuccess {
                self.showAlert(title: "Alert", message: str)
            }else{
                self.showAlert(title: "Alert", message: str)
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
