//
//  DashboardViewController.swift
//  API
//
//  Created by Apple on 01/07/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit
import WebKit
import GoogleMobileAds

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var webPage: WKWebView!
    @IBOutlet weak var webLeading: NSLayoutConstraint!
    @IBOutlet weak var webTrailing: NSLayoutConstraint!
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var labelName: UILabel!
    
    var strName = ""
    
    var hamburgConst = false
    
    let website = "https://aregcon.com/pages/main.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Do any additional setup after loading the view.
        
        webPage.load(URLRequest(url: URL(string: website)!))
        webPage.backgroundColor = .red
        
        labelName.text = strName
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    @IBAction func btnLogoutTabbed(_ sender: UIBarButtonItem) {
        
        APIManager.shareInstance.callingLogoutAPI()
    }

//    override func viewDidAppear(_ animated: Bool) {
//        performSegue(withIdentifier: "goToLogin", sender: self)
//        self.modalPresentationStyle = .fullScreen
//    }
    
    @IBAction func hamburgMenu(_ sender: Any) {
        
        if hamburgConst == false {
            webLeading.constant = 200
            webTrailing.constant = -200
            hamburgConst = true
        } else {
            webLeading.constant = 0
            webTrailing.constant = 0
            hamburgConst = false
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.view.backgroundColor = .gray
        }
    }
}

extension DashboardViewController {
    
    static func shareInstance() -> DashboardViewController {
       
        return DashboardViewController.instantiateFromStoryboard("Dashboard")
    }
}
