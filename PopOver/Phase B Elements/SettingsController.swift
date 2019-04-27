//
//  SettingsController.swift
//  PopOver
//
//  Created by Chris Porter on 4/10/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeBackground()
        placeItems()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buttonArray = ["Home", "Notifications", "Payment", "Task history", "Promotions", "Help", "Settings"]
    let buttonImageArray = ["home.png", "notifications.png", "payment.png", "history.png", "promotions.png", "help.png", "settings.png"]
    
    let dismissalBackground: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    let menuBackground: UIView = {
        let menuDisplay = UIView(frame: CGRect(x: 0, y: 0, width: 0.66*UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        menuDisplay.backgroundColor = .green
        menuDisplay.layer.shadowOpacity = 0.7
        menuDisplay.layer.shadowRadius = 6
        return menuDisplay
    }()
    
    let profileButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "user.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.tintColor = .darkGray
        return button
    }()
    
    let usersName: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.textColor = .darkGray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24)
        return label
    }()
    
    let usersEmail: UILabel = {
        let label = UILabel()
        label.text = "youremail@pugetsound.edu"
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    func makeBackground() {
        addSubview(menuBackground)
        menuBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
    }
    fileprivate func placeItems() {
        placeProfileButton()
        placeUsersName()
        placeUsersEmail()
        placeSeparatorLine()
    }
    
    fileprivate func placeProfileButton() {
        addSubview(profileButton)
        
        profileButton.anchors(top: menuBackground.topAnchor, topPad: 20, bottom: nil, bottomPad: 0, left: menuBackground.leftAnchor, leftPad: 20, right: menuBackground.rightAnchor, rightPad: 0, height: 0, width: 0)
        profileButton.centerXAnchor.constraint(equalTo: menuBackground.centerXAnchor).isActive = true
        profileButton.widthAnchor.constraint(equalTo: menuBackground.widthAnchor, multiplier: 1/4).isActive = true
        profileButton.heightAnchor.constraint(equalTo: menuBackground.widthAnchor, multiplier: 1/4).isActive = true
    }
    
    fileprivate func placeUsersName() {
        addSubview(usersName)
        usersName.anchors(top: profileButton.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: menuBackground.leftAnchor, leftPad: 10, right: menuBackground.rightAnchor, rightPad: 0, height: 30, width: 0)
        usersName.scalingAnchors(height: menuBackground.heightAnchor, heightScale: 1/24, width: menuBackground.widthAnchor, widthScale: 1)
        usersName.adjustsFontSizeToFitWidth = true
    }
    
    fileprivate func placeUsersEmail() {
        addSubview(usersEmail)
        usersEmail.anchors(top: usersName.bottomAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: menuBackground.leftAnchor, leftPad: 10, right: menuBackground.rightAnchor, rightPad: 10, height: 0, width: 0)
        usersEmail.scalingAnchors(height: menuBackground.heightAnchor, heightScale: 1/24, width: menuBackground.widthAnchor, widthScale: 4/5)
        usersEmail.adjustsFontSizeToFitWidth = true
    }
    
    fileprivate func placeSeparatorLine() {
        addSubview(separatorLine)
        separatorLine.anchors(top: usersEmail.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: menuBackground.leftAnchor, leftPad: 5, right: menuBackground.rightAnchor, rightPad: 5, height: 1, width: 0)
    }
}

