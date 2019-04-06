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
    
    fileprivate func printz() {
        print("~~")
        print(emailSentTo)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
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
        let confirmationLine = UILabel()
        confirmationLine.text = "Confirm your email address"
        confirmationLine.textColor = .white
        confirmationLine.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        confirmationLine.adjustsFontSizeToFitWidth = true
        
        //Notifies user that email has been sent
        let actionLine = UILabel()
        actionLine.text = "We sent a confirmation email to:"
        actionLine.textColor = .white
        actionLine.font = UIFont(name:"HelveticaNeue", size: 18)
        
        //Dynamically responds with whatever email was input
        let emailLine = UILabel()
        emailLine.text = emailSentTo
        emailLine.textColor = .white
        emailLine.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        
        //Asks user to check their email
        let actionRequestLine = UILabel()
        actionRequestLine.text = "Check your email and click on the confirmation link to coninue."
        actionRequestLine.textColor = .white
        actionRequestLine.font = UIFont(name:"HelveticaNeue", size: 18)
        actionRequestLine.numberOfLines = 0
        actionRequestLine.textAlignment = .center
        
        //gets screen size
        let screenSize: CGRect = UIScreen.main.bounds
        
        //Customizes stack properties
        let stack = UIStackView(arrangedSubviews: [confirmationLine, actionLine, emailLine, actionRequestLine])
        stack.axis = .vertical
        stack.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .equalCentering

        return stack
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "back.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white //makes image white
        return button
    }()
    
    fileprivate func placeLetterIcon() {
        view.addSubview(letter)
        
        
        letter.translatesAutoresizingMaskIntoConstraints = false
        
        let screenDimensions = UIScreen.main.bounds
        let quarterHeight = screenDimensions.height * 1/8
        
        //fixes email text entry field to center of screen
        NSLayoutConstraint.activate([
            letter.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/3),
            letter.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/3),
            letter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //letter.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            letter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: quarterHeight)
            ])
    }
    
    fileprivate func placeTextStack() {
        view.addSubview(textStack)
        
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        textStack.topAnchor.constraint(equalTo: letter.bottomAnchor).isActive = true
        textStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        textStack.alignment = .center
    }
    
    fileprivate func placeBackButton() {
        view.addSubview(backButton)
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 20, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 20, right: nil, rightPad: 0, height: 0, width: 0)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.contentMode = .scaleAspectFit
        
        backButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/16).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/24).isActive = true
    }
}
