//
//  APIManager.swift
//  alamofireProject
//
//  Created by Apple on 26/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
//import json
//import requests

enum APIErrors: Error {
    
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

class APIManager: UIViewController {
    
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(register: RegisterModel, completionHandler: @escaping (Bool, String) -> ()) {
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            
            debugPrint(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, "User Registeration Successful")
                    }else {
                        
                        
                        completionHandler(false, "Please try again")
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "Please try again")
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false, "Please try again")
            }
        }
        
    }
    
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping Handler) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "username=\(login.username)&password=\(login.password)"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: login_url)!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(.custom(message: "please check your internet connectivity")))
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
            
            do {
                let json = try JSONDecoder().decode(ResponseModel.self, from: data)
                // print(json)
                
                if response != nil {
                    
                    completionHandler(.success(json))
                    
                } else {
                    completionHandler(.failure(.custom(message: "please check your internet connectivity")))
                }
                
            } catch {
                print(error.localizedDescription)
                completionHandler(.failure(.custom(message: "Please try again")))
            }
        }
        task.resume()
        semaphore.wait()
        
        
        
        
        //        let semaphore = DispatchSemaphore (value: 0)
        //
        //        let parameters = "username=\(login.username)&password=\(login.password)"
        //        let postData =  parameters.data(using: .utf8)
        //
        //        var request = URLRequest(url: URL(string: login_url)!,timeoutInterval: Double.infinity)
        //        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //
        //        request.httpMethod = "POST"
        //        request.httpBody = postData
        //
        //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        //
        //            if let response = response {
        //
        //               // print(response)
        //            }
        //            guard let data = data, error == nil else {
        //                print(error!)
        //                return
        //            }
        //            do {
        //                var json = try JSONSerialization.jsonObject(with: data) as! [String : AnyObject]
        //                    print(json)
        //
        //
        //
        //
        //               // LoginResponseModel = try JSONDecoder().decode(json, from: data)
        //                //json =  try JSONDecoder().decode(ResponseModel, from: data)
        //
        //
        //
        ////                    if response?.statusCode == 200 {
        ////                        completionHandler(.success(json))
        ////                        print("login Successful")
        ////                    }else {
        ////
        ////                        completionHandler(.failure(.custom(message: "Please check your network connectivity")))
        ////                    }
        //                } catch {
        //                    print(error.localizedDescription)
        //                    completionHandler(.failure(.custom(message: "Please try again")))
        //
        //            }
        //
        //        }
        //        task.resume()
        //        semaphore.wait()
        
        //        let headers: HTTPHeaders = [
        //        .contentType("application/x-www-form-urlencoded")
        //
        //        ]
        
        //        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "":""]
        //
        //        //let parameters = "username=\(login.username)&password=\(login.password)"
        //
        //
        //        //let headers: [String : String]? = ["Content-Type": "application/x-www-form-urlencoded"]
        ////        let headers = [
        ////            .accept("application/json"),
        ////            .contentType("application/json")
        ////        ]
        //
        ////        let headers = [
        ////            .contentType("application/x-www-form-urlencoded"),
        //////            .cachecontrol("no-cache"),
        //////            .PostmanToken("f1d1e4ff-3c56-46cd-8aeb-bcf48a2b0b31")
        ////        ]
        //
        //        AF.request(login_url, method: HTTPMethod.post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
        //
        //            debugPrint(response)
        //
        //            switch response.result{
        //            case .success(let data):
        //                if let data = data {
        //                    do{
        //                        let json = try JSONSerialization.jsonObject(with: data) as? [String : AnyObject]
        //                        //                var json = try JSONSerialization.jsonObject(with: data!, options: [])
        //                        //let json = try JSONDecoder().decode(ResponseModel.self, from: data)
        //
        //                        print(json)
        //                        if response.response?.statusCode == 200 {
        //                            completionHandler(.success(json))
        //                            print("login Successful")
        //                        }else {
        //
        //                            completionHandler(.failure(.custom(message: "Please check your network connectivity")))
        //                        }
        //                    }catch{
        //                        print(error.localizedDescription)
        //                        completionHandler(.failure(.custom(message: "Please try again")))
        //                    }
        //
        //                }
        //
        //            case .failure(let err):
        //                print(err.localizedDescription)
        //                completionHandler(.failure(.custom(message: "Please try again")))
        //        }
        //    }
        
    }
    func callingLogoutAPI() {
        
        let headers: HTTPHeaders = [
            "user-token": "\(TokenService.tokenInstance.getToken())"
            
        ]
        
        AF.request(login_url, method: .get,  headers: headers).response {
            response in
            switch response.result {
            case .success(_):
                TokenService.tokenInstance.removeToken()
                //                vc.navigationController?.popToRootViewController(animated: true)
                let rootVC = UIApplication.shared.windows.first?.rootViewController
                if let topVC = UIApplication.getTopViewController() {
                    if rootVC?.children.first is DashboardViewController {
                        topVC.navigationController?.pushViewController(LoginViewController.shareInstance(), animated: true)
                    } else {
                        topVC.navigationController?.popToRootViewController(animated: true)
                    }
                }
            case .failure(let err):
                self.showAlert(title: "Logout failed", message: err.localizedDescription)
                
                print(err.localizedDescription)
            }
        }
        
        func showAlert(title:String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
