//
//  AppDelegate.swift
//  API
//
//  Created by Apple on 28/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        Thread.sleep(forTimeInterval: 3.0)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swippingController = SwipingController(collectionViewLayout: layout)
        
        
        let VC: UIViewController?
        if TokenService.tokenInstance.checkForToken(){

            VC = DashboardViewController.shareInstance()
        }else{
            VC = swippingController
//            VC = LoginViewController.shareInstance()
        }
        let navVC = UINavigationController(rootViewController: VC!)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
}

