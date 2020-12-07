//
//  SwipingController.swift
//  slide
//
//  Created by Apple on 08/06/2020.
//  Copyright © 2020 saad. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
//    let shareInstance = SwipingController()
    let pages = [
        
        Page(imageName: "firstImage", headerText: "Join us to learn more than you think", bodyText: "Are you ready for the fun that is wiating for you, there is a great magical things that will fill your heart with joy"),
        Page(imageName: "secondImage", headerText: "Subscribe us today to get coupons", bodyText: "Get notified for the videos that are comming up in the future and enjoy them."),
        Page(imageName: "thirdImage", headerText: "VIP members will get special services", bodyText: "There is a special chance fot the people to get special for us and get he exciting evenets to be at the front of the line"),
        Page(imageName: "Welcome", headerText:"Here you are ready to get into the Activity", bodyText: "Here now on you are getting to the page that will be use dto get login to the app the  you can enjoy the next steps ..Noe move on.")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevious() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc internal func handleNext() {
        let nextIndex = pageControl.currentPage + 1
        if nextIndex < 4 {
            let indexPath = IndexPath(item: nextIndex, section: 0)
            pageControl.currentPage = nextIndex
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            
            let currentStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc2 = currentStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            vc2.modalPresentationStyle = .fullScreen
            self.present(vc2, animated: true, completion: nil)
            
            
            //            //vc2.delegate = self
            //            let editorViewController = vc2
            //            let navEditorViewController: UINavigationController = UINavigationController(rootViewController: editorViewController)
            //            navEditorViewController.modalPresentationStyle = .fullScreen
            //            self.present(navEditorViewController, animated: true, completion: nil)
            
        }
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .blue
        pc .pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self , forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    fileprivate func setupBottomControls() {
        
        let bottomControlStactView = UIStackView(arrangedSubviews: [previousButton,  pageControl, nextButton])
        bottomControlStactView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStactView.distribution = .fillEqually
        view.addSubview(bottomControlStactView)
        
        NSLayoutConstraint.activate([
            bottomControlStactView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomControlStactView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStactView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStactView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page  = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

//extension SwipingController {
//    static func shareInstance() -> SwipingController {
//        return SwipingController.instantiateFromStoryboard("Main")
//    }
//}
