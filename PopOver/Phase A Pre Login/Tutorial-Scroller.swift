//
//  Tutorial-Scroller.swift
//  PopOver
//
//  Created by Chris Porter on 4/8/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class Tutorial : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildPageViewer()
        placeButton()
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    fileprivate func buildPageViewer() {
        
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let page1 = TutorialWelcome()
        let page2 = TutorialJobSelection()
        let page3 = TutorialFindHelp()
        let page4 = TutorialTaskCompletion()
        
        // add the individual viewControllers to the pageViewController
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        self.pages.append(page4)
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        // pageControl
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        self.pageControl.updateCurrentPageDisplay()
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/8, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex == 0 {
            } else {
                // go to previous page in array
                self.pageControl.currentPage -= 1
                adjustButton()
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                self.pageControl.currentPage += 1
                adjustButton()
                return self.pages[viewControllerIndex + 1]
            } else {
            }
        }
        return nil
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        button.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)
        return button
    }()

    
    fileprivate func placeButton() {
        view.addSubview(button)
        button.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/16, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    fileprivate func adjustButton() {
        if (self.pageControl.currentPage == 3) {
            self.button.setTitle("Sign up", for: .normal)
            } else {
            self.button.setTitle("Skip", for: .normal)
            }
        }
    
    @objc func toSignUp() {
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: false)
    }
}

