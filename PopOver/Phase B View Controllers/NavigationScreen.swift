//
//  NavigationScreen.swift
//  PopOver
//
//  Created by Chris Porter on 4/27/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class NavigationScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationController?.isNavigationBarHidden = true
        placeItems()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let toWorkerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 4/10, height: UIScreen.main.bounds.height * 4/10))
        button.setTitle("Continue as worker", for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        
        let gradient = CAGradientLayer()
        
        gradient.frame = button.bounds
        gradient.colors = [PURPLE_GRADIENT1.cgColor, PURPLE_GRADIENT2.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.cornerRadius = UIScreen.main.bounds.height * 1/32
        
        button.layer.insertSublayer(gradient, at: 0)
        
        button.addTarget(self, action: #selector(toWorker), for: .touchUpInside)
        return button
    }()
    
    fileprivate func placeItems() {
        view.addSubview(toWorkerButton)
        toWorkerButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: UIScreen.main.bounds.height * 1/20, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/20, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: 0, width: 0)
    }
    
    @objc func toWorker() {
        navigationController?.pushViewController(ActiveJobController(), animated: false)
    }
    
    @objc func toCustomer() {
        navigationController?.pushViewController(ActiveJobController(), animated: false)
    }
}
