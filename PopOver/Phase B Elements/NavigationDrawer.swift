//
//  NavigationDrawer.swift
//  PopOver
//
//  Created by Chris Porter on 4/6/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

//
//  NavigationDrawer.swift
//
//
//  Created by Chris Porter on 12/20/18.
//

import Foundation
import UIKit

class NavigationDrawer: UIView, UITableViewDelegate, UITableViewDataSource {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeBackground()
        placeItems()
        loadTableData()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buttonArray = ["Home", "Choose jobs", "Payment", "Task history", "Promotions", "Help", "Settings"]
    //let buttonArray = ["Home", "Choose jobs", "Coming soon", "Coming soon", "Coming soon", "Coming soon", "Coming soon"]
    let buttonImageArray = ["home.png", "notifications.png", "payment.png", "history.png", "promotions.png", "help.png", "settings.png"]
    
    let dismissalBackground: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    let menuBackground: UIView = {
        let menuDisplay = UIView(frame: CGRect(x: 0, y: 0, width: 0.66*UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        menuDisplay.backgroundColor = .white
        menuDisplay.layer.shadowOpacity = 0.7
        menuDisplay.layer.shadowRadius = 6
        return menuDisplay
    }()
    
    let menuShowing = false
    
    let menuTable: UITableView = {
        let table = UITableView()
        table.isScrollEnabled = false
        return table
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
    
    let darkModeSwitch: UISwitch = {
        let darkModeSwitch = UISwitch()
        darkModeSwitch.isOn = false
        darkModeSwitch.addTarget(self, action: #selector(flipSwitch), for: .touchUpInside)
        return darkModeSwitch
        
    }()
    
    @objc func flipSwitch() {
        if darkModeSwitch.isOn == false {
            darkModeSwitch.setOn(false, animated: true)
        } else if darkModeSwitch.isOn == true {
            darkModeSwitch.setOn(true, animated: true)
        }
    }
    
    func makeBackground() {
        addSubview(menuBackground)
        menuBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
    }
    
    fileprivate func placeItems() {
        placeProfileButton()
        placeUsersName()
        placeUsersEmail()
        placeSeparatorLine()
        loadTableData()
        loadBlankButton()
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
    
    
    //
    func loadTableData() {
        menuTable.dataSource = self
        menuTable.delegate = self
        menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        menuTable.rowHeight = UIScreen.main.bounds.height * 0.0825 //sets the height of the rows on the side menu
        menuTable.backgroundColor = .white
        menuTable.tableFooterView = UIView()
        menuTable.separatorStyle = .none
        
        addSubview(menuTable)
        menuTable.anchors(top: separatorLine.bottomAnchor, topPad: 10, bottom: menuBackground.bottomAnchor, bottomPad: 1/8*UIScreen.main.bounds.height, left: menuBackground.leftAnchor, leftPad: 0, right: menuBackground.rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    func loadBlankButton() {
        addSubview(dismissalBackground)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        var cell:UITableViewCell?
        
        if cell?.isHighlighted == true {
            cell?.backgroundColor = THEME_ACCENT
        }
        
        //builds the menu table on the side menu, populates with options for other pages to go to
        //adds images to left of each button
        if tableView == self.menuTable {
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: UIScreen.main.bounds.height * 0.0825))
            
            let paddingImage = UIImageView()
            
            let bgColorView = UIView()

            bgColorView.backgroundColor = THEME_HIGHLIGHTS
            
            cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            cell!.textLabel!.text = buttonArray[indexPath.row] //populates the data
            cell?.backgroundColor = .white //background color of the cells
            cell?.textLabel?.textColor = .darkGray //text color of the cells
            cell?.textLabel?.highlightedTextColor = THEME_MAIN
            cell?.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
            cell?.layer.cornerRadius = 5
            cell?.selectedBackgroundView = bgColorView
            cell?.layoutMargins.left = menuBackground.bounds.width * 0.225
            cell?.layoutMargins.right = menuBackground.bounds.width * 0.1
            cell?.addSubview(paddingView)
            
            if cell?.isSelected == true {
                paddingImage.tintColor = THEME_MAIN
            }
            
            paddingImage.image = UIImage(named: buttonImageArray[indexPath.row])!.withRenderingMode(.alwaysTemplate)
            paddingImage.tintColor = .gray
            paddingImage.contentMode = .scaleAspectFit
            paddingImage.frame = CGRect(x: UIScreen.main.bounds.height * 0.015, y: 0, width: 35, height: UIScreen.main.bounds.height * 0.0825)
            paddingImage.layer.masksToBounds = true
            paddingImage.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor)
            
            paddingView.addSubview(paddingImage)
            paddingView.contentMode = .bottom
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTable {
            //if choosing an option in the side menu, directs to one of the corresponding pages
            if indexPath.row == 0 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            } else if indexPath.row == 1 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(ActiveJobController(), animated: false)
            } else if indexPath.row == 2 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            } else if indexPath.row == 3 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            } else if indexPath.row == 4 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            } else if indexPath.row == 5 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            } else if indexPath.row == 6 {
                (superview?.next as? UIViewController)?.navigationController?.pushViewController(HomeScreenController(), animated: false)
            }
        }
    }
    
} //end of side menu class
