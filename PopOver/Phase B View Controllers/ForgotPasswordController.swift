//
//  ForgotPasswordController.swift
//  PopOver
//
//  Created by Chris Porter on 4/3/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME_MAIN
        navigationController?.isNavigationBarHidden = true
        placeItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let emailTextField: UITextField = {
        

        
        //masks object and applies rounded corners, ignore parameters
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.layer.cornerRadius = 10 //sets corner radius
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
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
        button.setTitle("Back to login", for: .normal)
        
        //adjusts font size to width of button
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //pushes to sign up controller
        button.addTarget(self, action: #selector(toLoginController), for: .touchUpInside)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.tintColor = UIColor.white //makes image white
        return button
    }()
    
    fileprivate func placeItems() {
        placePasswordField()
        placeBackToLoginButton()
    }
    
    fileprivate func placePasswordField() {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //fixes email text entry field to center of screen
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 4/5),
            emailTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/16),
            emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }
    
    fileprivate func placeBackToLoginButton() {
        view.addSubview(backToLoginButton)
        backToLoginButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 20, left: emailTextField.leftAnchor, leftPad: 0, right: emailTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
    }
    
    
    fileprivate func placeBackButton() {
        view.addSubview(backButton)
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 10, right: nil, rightPad: 0, height: 0, width: 0)
    }
    
    @objc func toLoginController() {
        //Change push location
        let controller = LoginController()
        
        //Pushes to view controller
        navigationController?.pushViewController(controller, animated: false)
    }
}
