//
//  SwipeMain.swift
//  Aregcon
//
//  Created by Apple on 10/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit

class SwipeMain: UIViewController {
    
   let appsImages: UIImageView = {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "elegant-business-logos_23-2147491506"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let descriptingTextView: UITextView = {
            let textView = UITextView()
            let attributedText = NSMutableAttributedString(string: "Join Us today in our fun and game", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\nHere is all the way you can have access to the mods that you have aready been dreaming for and its gonna be so fun.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            textView.attributedText = attributedText
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isScrollEnabled = false
            return textView
        }()
        
        private let previousButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Previous", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.gray, for: .normal)
            return button
        }()
        
        private let nextButton: UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("Next", for: .normal)
               button.translatesAutoresizingMaskIntoConstraints = false
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
               return button
           }()
        
        private let pageControl: UIPageControl = {
            let pc = UIPageControl()
            pc.currentPage = 0
            pc.numberOfPages = 4
            pc.currentPageIndicatorTintColor = .blue
            pc .pageIndicatorTintColor = .gray
            return pc
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(descriptingTextView)
            
            setupBottomControls()
            
            setupLayout()
            
            descriptingTextView.topAnchor.constraint(equalTo: appsImages.bottomAnchor).isActive = true
            descriptingTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            descriptingTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        }
        
        fileprivate func setupBottomControls() {
            
            let bottomControlStactView = UIStackView(arrangedSubviews: [previousButton,  pageControl, nextButton])
            bottomControlStactView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlStactView.distribution = .fillEqually
            view.addSubview(bottomControlStactView)
            
            NSLayoutConstraint.activate([
                bottomControlStactView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlStactView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlStactView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlStactView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        }
        
        fileprivate func setupLayout() {
             let topImageContainerView = UIView()
    //         topImageContainerView.backgroundColor = .blue
             view.addSubview(topImageContainerView)
             //        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
             topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
             topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
             topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
             topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            topImageContainerView.addSubview(appsImages)
            appsImages.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
            appsImages.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
            appsImages.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.9).isActive = true
            appsImages.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.9).isActive = true
         }

}

extension SwipeMain {
    static func shareInstance() -> SwipeMain {
        return SwipeMain.instantiateFromStoryboard("Main")
    }
}
