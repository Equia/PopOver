//
//  EmailSentController.swift
//  PopOver
//
//  Created by Chris Porter on 4/4/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class EmailSentController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME_MAIN
        navigationController?.isNavigationBarHidden = true
        placeLetterIcon()
        placeTextStack()
        placeBackButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var stringPassed = ""
    
    //LETTER ICON
    //1. Builds icon
    let letter: UIImageView = {
        let letter = UIImageView()
        
        //sets image and allows it to be tinted
        letter.image = UIImage(named: "message.png")!.withRenderingMode(.alwaysTemplate)
        
        //makes image white
        letter.tintColor = UIColor.white
        
        //keeps image proportional
        letter.contentMode = .scaleAspectFit
        
        //masks layer
        letter.layer.masksToBounds = true
        
        return letter
    }()
    
    //STACK OF TEXT
    //1. Builds stackview
    //2. Adds text to stack
    let textStack: UIStackView = {
        
        
        //Top line/title label
        //Can adjust text, color, font and font size
        let confirmationLine = UILabel()
        confirmationLine.text = "Confirm your email address"
        confirmationLine.textColor = .white
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        confirmationLine.adjustsFontSizeToFitWidth = true
        
        //Notifies user that email has been sent
        //Can adjust text, color, font and font size
        let actionLine = UILabel()
        actionLine.text = "We sent a confirmation email to:"
        actionLine.textColor = .white
        actionLine.font = UIFont(name:"HelveticaNeue", size: 18)
        
        //Dynamically responds with whatever email was input
        //Can adjust text, color, font and font size
        let emailLine = UILabel()
        emailLine.text = "youremail@pugetsound.edu" //NEED TO FIND A WAY TO MAKE THIS ADAPT TO THE EMAIL INPUT FROM THE SIGNUPCONTROLLER VC
        emailLine.textColor = .white
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        confirmationLine.adjustsFontSizeToFitWidth = true
        
        //Asks user to check their email
        //Can adjust text, color, font and font size
        let actionRequestLine = UILabel()
        actionRequestLine.text = "Check your email and click on the confirmation link to coninue."
        actionRequestLine.textColor = .white
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        actionRequestLine.numberOfLines = 0
        actionRequestLine.textAlignment = .center
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        //Arranges stack, with top on left and bottom on right
        let stack = UIStackView(arrangedSubviews: [confirmationLine, actionLine, emailLine, actionRequestLine])
        
        //sets the stack to be vertical
        stack.axis = .vertical
        
        //sets the frame of the stack to be the screen size
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        //sets the spacing of the stack
        stack.spacing = 10
        
        //sets the alignment of the stack
        stack.alignment = .center
        
        //sets distribution of stack components to be equal
        stack.distribution = .equalCentering

        return stack
    }()
    
    //BACK BUTTON
    //1. Builds back button
    //2. Button sends user to login screen
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "back.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white //makes image white
        button.addTarget(self, action: #selector(toLogin), for: .touchUpInside) //adds functionality
        return button
    }()
    
    fileprivate func placeLetterIcon() {
        //adds letter to the screen
        view.addSubview(letter)
        
        //adds adjustment layer to letter object
        letter.translatesAutoresizingMaskIntoConstraints = false
        
        //gets screen dimensions and calculates 1/8 of the screen size
        let screenDimensions = UIScreen.main.bounds
        let eighthHeight = screenDimensions.height * 1/8
        
        //fixes email text entry field to center of screen
        NSLayoutConstraint.activate([
            letter.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/3),
            letter.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/3),
            letter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            letter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: eighthHeight)
            ])
    }
    
    fileprivate func placeTextStack() {
        //adds the text stack to the screen
        view.addSubview(textStack)
        
        //adds adjustment layer to letter object
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        //fixes text stack to underneath the letter
        textStack.topAnchor.constraint(equalTo: letter.bottomAnchor).isActive = true
        
        //constrains text stack to center of screen
        textStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //constrains width of text stack to 4/5 of screen width
        textStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        
        //aligns text stack in center
        textStack.alignment = .center
    }
    
    fileprivate func placeBackButton() {
        //places backButton on screen
        view.addSubview(backButton)
        
        //sets visual constraints of back button
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 20, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 20, right: nil, rightPad: 0, height: 0, width: 0)
        
        //adds adjustment layer to back button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        //fixes aspect ratio
        backButton.contentMode = .scaleAspectFit
        
        //sets width constraint
        backButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/16).isActive = true
        
        //sets height constraint
        backButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/24).isActive = true
    }
    
    //pushes the view controller on the top of the stack to the login controller
    @objc func toLogin() {
        let controller = LoginController()
        
        //does the pushing
        navigationController?.pushViewController(controller, animated: false)
    }
}
