//
//  LoginController.swift
//  PopOver
//
//  Created by Chris Porter on 3/30/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME_MAIN
        navigationController?.isNavigationBarHidden = true
        placeItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MAIN ICON
    //1. Builds icon
    //2. Customizes image
    let popOverIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "whitepng") //sets image for icon
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
        
        
        //sets attributed text of field
        textField.attributedPlaceholder = NSAttributedString(string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        //masks layer for left text inset (to change, adjust width)
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        //textField.leftViewMode = .always //applies left text inset
        
        //sets bottom border color
        textField.setBottomBorder(backgroundColor: THEME_ACCENT, borderColor: .white)
        
        return textField
    }()
    
    //PASSWORD TEXT ENTRY
    //1. Builds field
    //2. Customizes the attributes
    let passwordTextField: UITextField = {
        
        //masks object and applies rounded corners, ignore parameters
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.layer.cornerRadius = 10 //sets corner radius
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] //adjusts which corners are rounded
        
        //sets text color to white
        textField.textColor = .white
        
        //makes it so any text entry is aesthetically converted to dots
        textField.isSecureTextEntry = true
        
        //sets background color
        textField.backgroundColor = THEME_ACCENT
        
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
        
        //sets attributed text of field
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        return textField
    }()
    
    //LOGIN BUTTON
    //1. Builds button
    //2. Checks credentials, then signs in if information is correct
    let loginButton: UIButton = {
        let button = UIButton()
        
        //changes color of button
        button.backgroundColor = THEME_ACCENT_2
        
        //sets button text
        button.setTitle("Login", for: .normal)
        
        return button
    }()
    
    //SIGN UP BUTTON
    //1. Builds button
    //2. Pushes to sign up page when clicked
    let signUpText: UIButton = {
        let button = UIButton()
        
        //sets button text
        button.setTitle("Don't have an account? Sign up", for: .normal)
        
        //adjusts font size to width of button
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //pushes to sign up controller
        button.addTarget(self, action: #selector(toSignUpController), for: .touchUpInside)
        return button
    }()
    
    //FORGOT PASSWORD BUTTON
    //1. Builds button
    //2. Redirects to password reset page
    let forgotPassText: UIButton = {
        let button = UIButton()
        
        //sets button text
        button.setTitle("Forgot password?", for: .normal)
        button.addTarget(self, action: #selector(toForgotPasswordController), for: .touchUpInside)
        //adjusts font size to width of button
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    //Places all items on the view controller
    fileprivate func placeItems() {
        placeUserTextField()
        placePasswordTextField() //contingent on user text field location, must come after
        placeForgotPassButton() //contingent on password text field location, must come after
        placeLoginButton() //contingent on forgot password button location, must come after
        placeSignUpButton() //contingent on login button location, must come after
        placeIcon() //contingent on user text field location, must come after
    }
    
    
    //Places the user text field onto the view controller
    //Called through function: placeItems()
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
    
    //Places the password text field onto the view controller
    //Called through function: placeItems()
    fileprivate func placePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.anchors(top: userTextField.bottomAnchor, topPad: 1, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
    }
    
    //Places the forgot password text/button onto the view controller
    //Pushes to reset password screen
    //Called through the function: placeItems()
    fileprivate func placeForgotPassButton() {
        view.addSubview(forgotPassText)
        forgotPassText.anchors(top: passwordTextField.bottomAnchor, topPad: 15, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
    }
    
    //Places the login button onto the view controller
    //Called through the function: placeItems()
    fileprivate func placeLoginButton() {
        view.addSubview(loginButton)
        loginButton.anchors(top: forgotPassText.bottomAnchor, topPad: 15, bottom: nil, bottomPad: 0, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 50, width: 0)
        loginButton.layer.cornerRadius = 25
    }
    
    //Places the new account creation button onto the view controller
    //Pushes to sign up view controller
    //Called through the function: placeItems()
    fileprivate func placeSignUpButton() {
        view.addSubview(signUpText)
        signUpText.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 20, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
    }
    
    fileprivate func placeIcon() {
        view.addSubview(popOverIcon)
        popOverIcon.anchors(top: nil, topPad: 0, bottom: userTextField.topAnchor, bottomPad: 40, left: userTextField.leftAnchor, leftPad: 0, right: userTextField.rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    //Pushes the view controller to the sign up controller
    @objc func toSignUpController() {
        
        //Change push location
        let signUpPage = SignUpController()
        
        //Pushes to view controller
        navigationController?.pushViewController(signUpPage, animated: false)
    }
    
    @objc func toForgotPasswordController() {
        
        //Change push location
        let controller = ForgotPasswordController()
        
        //Pushes to view controller
        navigationController?.pushViewController(controller, animated: false)
    }
    
    @objc func pushToEmailSent() {
        //Change push location
        let controller = ForgotPasswordController()
        
        //Pushes to view controller
        navigationController?.pushViewController(controller, animated: false)
    }
    
}
