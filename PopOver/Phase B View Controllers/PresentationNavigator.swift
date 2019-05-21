//
//  PresentationNavigator.swift
//  PopOver
//
//  Created by Chris Porter on 5/15/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class PresentationNavigator: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        placeButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let customerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 5
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        button.setTitle("Explore as customer", for: .normal)
        button.addTarget(self, action: #selector(toCustomer), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
        return button
    }()
    
    @objc func toCustomer() {
        navigationController?.pushViewController(CustomerJobPicker(), animated: true)
    }
    
    let workerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 5
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        button.setTitle("Explore as worker", for: .normal)
        button.addTarget(self, action: #selector(toWorker), for: .touchUpInside)
                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
        return button
    }()
    
    @objc func toWorker() {
        navigationController?.pushViewController(Dashboard(), animated: true)
    }
    
    let logoImage: UIImageView = {
        let icon = UIImageView()
            icon.image = UIImage(named: "logo.png")!.withRenderingMode(.alwaysTemplate) //sets image for icon
            icon.contentMode = UIView.ContentMode.scaleAspectFit //maintains aspect ratio of image
            icon.tintColor = ORANGE_THEME //tints item
        return icon
    }()
    
    fileprivate func placeButtons() {
        view.addSubview(customerButton)
        customerButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: UIScreen.main.bounds.height * 1/16, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/10, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/10, height: UIScreen.main.bounds.height * 2.5/10, width: 0)
        
        view.addSubview(workerButton)
        workerButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/16, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/10, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/10, height: UIScreen.main.bounds.height * 2.5/10, width: 0)
        
        view.addSubview(logoImage)
        logoImage.anchors(top: customerButton.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/32, bottom: workerButton.topAnchor, bottomPad: UIScreen.main.bounds.height * 1/32, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        logoImage.centerXAnchor.constraint(equalTo: customerButton.centerXAnchor).isActive = true
    }
}
