//
//  UIViewController + Extension.swift
//  Aregcon
//
//  Created by Apple on 01/07/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func instantiateFromStoryboard(_ name:String) -> Self {
        
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        return controller
    }
    
    func showAlert(title:String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
}
