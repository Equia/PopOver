//
//  SignUpController.swift
//  PopOver
//
//  Created by Chris Porter on 4/3/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

public var emailSentTo: UILabel = {
    var text = UILabel()
    text.text = ""
    return text
}()

class SignUpController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets background color
        view.backgroundColor = THEME_MAIN
        
        //hides navigation bar
        navigationController?.isNavigationBarHidden = true
        
        //loads items onto the screen
        placeItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //POPOVER ICON
    //1. Builds icon
    let popOverIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "logo") //sets image for icon
        icon.contentMode = UIView.ContentMode.scaleAspectFit //maintains aspect ratio of image
        return icon
    }()
    
    //USERNAME TEXT ENTRY
    //1. Builds field
    //2. Customizes the attributes
    let userTextField: UITextField = {
        
        //masks object and applies rounded corners, ignore parameters
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.layer.cornerRadius = 10 //sets corner radius
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] //adjusts which corners are rounded
        
        //change text color
        textField.textColor = .white
        
        //sets background color of text box
        textField.backgroundColor = THEME_ACCENT
        
        //sets attributed text of field
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //ADDS PADDING VIEW
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: textField.frame.height))
        
        //IMBEDS IMAGE IN PADDING VIEW
        let paddingImage = UIImageView()
        paddingImage.image = UIImage(named: "message.png")!.withRenderingMode(.alwaysTemplate) //sets the image
        paddingImage.tintColor = UIColor.white //makes image white
        paddingImage.contentMode = .scaleAspectFit
        paddingImage.frame = CGRect(x: 10, y: -15, width: 30, height: 30) //moves image within padding view
        paddingImage.layer.masksToBounds = true
        
        //adds padding image to the padding view and centers it
        paddingView.addSubview(paddingImage)
        paddingImage.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor)
        
        //aligns the padding view on the left
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        //sets bottom border color
        textField.setBottomBorder(backgroundColor: THEME_ACCENT, borderColor: .white)
        
        return textField
    }()
    
    //PASSWORD TEXT ENTRY
    //1. Builds field
    //2. Customizes the attributes
    let passwordTextField: UITextField = {
        
        //masks object and applies rounded corners, ignore parameters
        let textField = UITextField()
        
        //change text color
        textField.textColor = .white
        
        //sets background color of text box
        textField.backgroundColor = THEME_ACCENT
        
        //sets attributed text of field
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //ADDS PADDING VIEW
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: textField.frame.height))
        
        //IMBEDS IMAGE IN PADDING VIEW
        let paddingImage = UIImageView()
        paddingImage.image = UIImage(named: "lock.png")!.withRenderingMode(.alwaysTemplate) //sets the image
        paddingImage.tintColor = UIColor.white //makes image white
        paddingImage.contentMode = .scaleAspectFit
        paddingImage.frame = CGRect(x: 10, y: -15, width: 30, height: 30) //moves image within padding view
        paddingImage.layer.masksToBounds = true
        
        //adds padding image to the padding view and centers it
        paddingView.addSubview(paddingImage)
        paddingImage.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor)
        
        //aligns the padding view on the left
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        //makes it so any text entry is aesthetically converted to dots
        textField.isSecureTextEntry = true
        

        
        //sets bottom border color
        textField.setBottomBorder(backgroundColor: THEME_ACCENT, borderColor: .white)
        
        return textField
    }()
    
    //CONFIRM PASSWORD TEXT ENTRY
    //1. Builds field
    //2. Customizes the attributes
    let confirmPasswordTextField: UITextField = {
        
        //masks object and applies rounded corners, ignore parameters
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.layer.cornerRadius = 10 //sets corner radius
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] //adjusts which corners are rounded
        
        //change text color
        textField.textColor = .white
        
        //sets background color of text box
        textField.backgroundColor = THEME_ACCENT
        
        //sets attributed text of field
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //ADDS PADDING VIEW
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: textField.frame.height))
        
        //IMBEDS IMAGE IN PADDING VIEW
        let paddingImage = UIImageView()
        paddingImage.image = UIImage(named: "lock.png")!.withRenderingMode(.alwaysTemplate) //sets the image
        paddingImage.tintColor = UIColor.white //makes image white
        paddingImage.contentMode = .scaleAspectFit
        paddingImage.frame = CGRect(x: 10, y: -15, width: 30, height: 30) //moves image within padding view
        paddingImage.layer.masksToBounds = true
        
        //adds padding image to the padding view and centers it
        paddingView.addSubview(paddingImage)
        paddingImage.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor)
        
        //aligns the padding view on the left
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        //makes it so any text entry is aesthetically converted to dots
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    //BACK TO LOGIN BUTTON
    //1. Builds button
    //2. Pushes to login page when clicked
    let backToLoginButton: UIButton = {
        let button = UIButton()
        
        //sets button text
        button.setTitle("Already have an account? Sign in", for: .normal)
        
        //adjusts font size to width of button
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //pushes to sign up controller
        button.addTarget(self, action: #selector(toSignUpController), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = THEME_ACCENT_2
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(toEmailSentController), for: .touchUpInside)
        return button
    }()
    
    fileprivate func placeItems() {
        placeUserTextField()
        placePasswordTextField()
        placeConfirmPasswordTextField()
        placeRegisterButton()
        placeBackToLoginButton()
        placeIcon()
        
    }
    
    fileprivate func placeIcon() {
        view.addSubview(popOverIcon)
        popOverIcon.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 30, bottom: userTextField.topAnchor, bottomPad: 40, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 0, width: 0)
        popOverIcon.contentMode = .scaleAspectFit
    }
    
    fileprivate func placeUserTextField() {
        view.addSubview(userTextField)
        
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //fixes email text entry field to center of screen
        NSLayoutConstraint.activate([
            userTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 4/5),
            userTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/16),
            userTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
    }
    
    fileprivate func placePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.anchors(top: userTextField.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
    }
    
    fileprivate func placeConfirmPasswordTextField() {
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.anchors(top: passwordTextField.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
    }
    
    fileprivate func placeBackToLoginButton() {
        view.addSubview(backToLoginButton)
        backToLoginButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 20, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
    }
    
    fileprivate func placeRegisterButton() {
        view.addSubview(registerButton)
        registerButton.anchors(top: confirmPasswordTextField.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
        registerButton.layer.cornerRadius = 25
    }
    
    @objc func toSignUpController() {
        
        //Change push location
        let controller = LoginController()
        
        //Pushes to view controller
        navigationController?.pushViewController(controller, animated: false)
    }
    
    @objc func toEmailSentController() {
        
        //Change push location
        let controller = EmailSentController()
        
        emailSentTo.text = userTextField.text ?? "youremail@gmail.com"
        controller.stringPassed = userTextField.text ?? "youremail@gmail.com"
        
        //Pushes to view controller
        navigationController?.pushViewController(controller, animated: false)
    }
}
