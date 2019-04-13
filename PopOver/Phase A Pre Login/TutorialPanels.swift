//
//  TutorialPanels.swift
//  PopOver
//
//  Created by Chris Porter on 4/8/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class TutorialWelcome: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: BLUE_GRADIENT1, colorTwo: BLUE_GRADIENT2)
        placeItems()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let textStack: UIStackView = {
        
        //##################################### TOP OF STACK #####################################
        //Top line/title label
        let confirmationLine = UILabel()
        
        //text
        confirmationLine.text = "PopOver"
        
        //textcolor
        confirmationLine.textColor = .white
        
        //font and size
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 36)
        
        //scaling font enabled
        confirmationLine.adjustsFontSizeToFitWidth = true
        
        //changes sizing & layout
        confirmationLine.sizeToFit()
        confirmationLine.layoutIfNeeded()
        
        //##################################### LOGO IN STACK #####################################
        
        //Notifies user that email has been sent
        let image = UIImageView()
        
        //image
        image.image = #imageLiteral(resourceName: "TaskIcon")
        
        //maintain aspect ratio
        image.contentMode = .scaleAspectFit
        
        //changes sizing
        image.sizeToFit()
        
        //constrains height to 2/5 of screen height and centers in y axis
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2/5).isActive = true
        image.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        
        //##################################### TEXT BELOW IMAGE IN STACK #####################################
        
        //Dynamically responds with whatever email was input
        let emailLine = UILabel()
        
        //text
        emailLine.text = "Welcome to PopOver"
        
        //text color
        emailLine.textColor = .white
        
        //font and size
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        
        //dynamically adjusts font
        emailLine.adjustsFontSizeToFitWidth = true
        
        //changes sizing & layout
        emailLine.sizeToFit()
        emailLine.layoutIfNeeded()
        
        
        //##################################### DESCRIPTION TEXT #####################################
        
        //Asks user to check their email
        let actionRequestLine = UILabel()
        
        //text
        actionRequestLine.text = "Overwhelmed with tasks? Our service helps connect you with other hard-working students willing to help out."
        
        //text color
        actionRequestLine.textColor = .white
        
        //font and size
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        
        //allows wrapping
        actionRequestLine.numberOfLines = 0
        
        //text alignment
        actionRequestLine.textAlignment = .center
        
        //size and layout
        actionRequestLine.sizeToFit()
        actionRequestLine.layoutIfNeeded()
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        let stack = UIStackView(arrangedSubviews: [confirmationLine, image, emailLine, actionRequestLine])
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        stack.spacing = 10
        stack.alignment = .center
        stack.layoutIfNeeded()
        stack.sizeToFit()
        
        return stack
    }()
    
    func placeItems() {
        //placeBackground()
        placeStack()
    }
    
    fileprivate func placeStack() {
        view.addSubview(textStack)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        textStack.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: height * 1/4, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: width * 1/16, height: 0, width: 0)
    }
    
    fileprivate func placeBackground() {
        //view.addSubview(menuBackground)
    }
}

class TutorialJobSelection: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME_MAIN
        placeItems()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let textStack: UIStackView = {
        
        
        //Top line/title label
        let confirmationLine = UILabel()
        confirmationLine.text = "PopOver"
        confirmationLine.textColor = .white
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 36)
        confirmationLine.adjustsFontSizeToFitWidth = true
        confirmationLine.sizeToFit()
        confirmationLine.layoutIfNeeded()
        
        //Notifies user that email has been sent
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "searchIcon")
        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2/5).isActive = true
        //image.layoutIfNeeded()
        image.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        
        //Dynamically responds with whatever email was input
        let emailLine = UILabel()
        emailLine.text = "What do you need help with?"
        emailLine.textColor = .white
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        emailLine.adjustsFontSizeToFitWidth = true
        emailLine.sizeToFit()
        emailLine.layoutIfNeeded()
        
        
        //Asks user to check their email
        let actionRequestLine = UILabel()
        actionRequestLine.text = "First, select the task category you need help with and give us a few details about what you need."
        actionRequestLine.textColor = .white
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        actionRequestLine.numberOfLines = 0
        actionRequestLine.textAlignment = .center
        actionRequestLine.sizeToFit()
        actionRequestLine.layoutIfNeeded()
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        let stack = UIStackView(arrangedSubviews: [confirmationLine, image, emailLine, actionRequestLine])
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        stack.spacing = 10
        stack.alignment = .center
        stack.layoutIfNeeded()
        stack.sizeToFit()
        
        return stack
    }()
    
     func placeItems() {
        placeStack()
    }
    
    fileprivate func placeStack() {
        view.addSubview(textStack)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        textStack.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: height * 1/4, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: width * 1/16, height: 0, width: 0)
    }
    
}

class TutorialFindHelp: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: BLUE_GRADIENT1, colorTwo: BLUE_GRADIENT2)
        placeItems()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let textStack: UIStackView = {
        
        
        //Top line/title label
        let confirmationLine = UILabel()
        confirmationLine.text = "PopOver"
        confirmationLine.textColor = .white
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 36)
        confirmationLine.adjustsFontSizeToFitWidth = true
        confirmationLine.sizeToFit()
        confirmationLine.layoutIfNeeded()
        
        //Notifies user that email has been sent
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "findIcon")
        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2/5).isActive = true
        //image.layoutIfNeeded()
        image.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        
        //Dynamically responds with whatever email was input
        let emailLine = UILabel()
        emailLine.text = "Let's find you some help..."
        emailLine.textColor = .white
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        emailLine.adjustsFontSizeToFitWidth = true
        emailLine.sizeToFit()
        emailLine.layoutIfNeeded()
        
        
        //Asks user to check their email
        let actionRequestLine = UILabel()
        actionRequestLine.text = "Next, we handle all the work of finding someone to help out with your unique task."
        actionRequestLine.textColor = .white
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        actionRequestLine.numberOfLines = 0
        actionRequestLine.textAlignment = .center
        actionRequestLine.sizeToFit()
        actionRequestLine.layoutIfNeeded()
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        let stack = UIStackView(arrangedSubviews: [confirmationLine, image, emailLine, actionRequestLine])
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        stack.spacing = 10
        stack.alignment = .center
        stack.layoutIfNeeded()
        stack.sizeToFit()
        
        return stack
    }()
    
    func placeItems() {
        placeStack()
    }
    
    fileprivate func placeStack() {
        view.addSubview(textStack)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        textStack.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: height * 1/4, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: width * 1/16, height: 0, width: 0)
    }
}

class TutorialTaskCompletion: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: PURPLE_GRADIENT1, colorTwo: PURPLE_GRADIENT2)
        placeItems()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let textStack: UIStackView = {
        
        
        //Top line/title label
        let confirmationLine = UILabel()
        confirmationLine.text = "PopOver"
        confirmationLine.textColor = .white
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 36)
        confirmationLine.adjustsFontSizeToFitWidth = true
        confirmationLine.sizeToFit()
        confirmationLine.layoutIfNeeded()
        
        //Notifies user that email has been sent
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "finishedIcon")
        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2/5).isActive = true
        //image.layoutIfNeeded()
        image.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        
        //Dynamically responds with whatever email was input
        let emailLine = UILabel()
        emailLine.text = "Task Completed!"
        emailLine.textColor = .white
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        emailLine.adjustsFontSizeToFitWidth = true
        emailLine.sizeToFit()
        emailLine.layoutIfNeeded()
        
        
        //Asks user to check their email
        let actionRequestLine = UILabel()
        actionRequestLine.text = "Finally, a PopOver trusted worker will show up to help. WIth a job well done, you no longer have to stress!"
        actionRequestLine.textColor = .white
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        actionRequestLine.numberOfLines = 0
        actionRequestLine.textAlignment = .center
        actionRequestLine.sizeToFit()
        actionRequestLine.layoutIfNeeded()
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        let stack = UIStackView(arrangedSubviews: [confirmationLine, image, emailLine, actionRequestLine])
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        stack.spacing = 10
        stack.alignment = .center
        stack.layoutIfNeeded()
        stack.sizeToFit()
        
        return stack
    }()
    
    func placeItems() {
        placeStack()
    }
    
    fileprivate func placeStack() {
        view.addSubview(textStack)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        textStack.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: height * 1/4, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: width * 1/16, height: 0, width: 0)
    }
}
