//
//  pageCell.swift
//  slide
//
//  Created by Apple on 09/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else {return}
            
            appsImages.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
                
            attributedText.append(NSAttributedString(string: "\n\n\n \(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
            descriptingTextView.attributedText = attributedText
            descriptingTextView.textAlignment = .center
        }
    }
    
    private let appsImages: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "secondImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptingTextView: UITextView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .purple
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        fileprivate func setupLayout() {
             let topImageContainerView = UIView()
    
             addSubview(topImageContainerView)
             topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
             topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
             topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
             topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
             topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            
            topImageContainerView.addSubview(appsImages)
            appsImages.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
            appsImages.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
            appsImages.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.9).isActive = true
            appsImages.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.9).isActive = true
            
            addSubview(descriptingTextView)
            descriptingTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
            descriptingTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            descriptingTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
            descriptingTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
         }
}
