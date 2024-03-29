//
//  CustomerJobPicker.swift
//  PopOver
//
//  Created by Chris Porter on 4/27/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class CustomerJobPicker: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        buildBanner()
        buildBackground()
        buildButtons()
        loadConfirmButton()
        placeButtonLabels()
    }
    
    var activeTaskCount = 0
    
    var errorStatus = false
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //purple banner on top of screen
    let purpleBanner: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/8))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [ORANGE_THEME.cgColor, ORANGE_GRADIENT_ACCENT.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    let backgroundPlate: UIView = {
        let plate = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 9/10, height: UIScreen.main.bounds.height * 0.74))
        let gradient = CAGradientLayer()
        plate.backgroundColor = .white
        plate.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        plate.layer.shadowColor = UIColor.darkGray.cgColor
        plate.layer.shadowRadius = 5
        plate.layer.shadowOpacity = 0.7
        plate.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        gradient.frame = plate.bounds
        gradient.colors = [UIColor(displayP3Red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 1), UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 12.0, y: 7.0)
        gradient.cornerRadius = UIScreen.main.bounds.width * 1/32
        
        plate.layer.insertSublayer(gradient, at: 0)
        
        
        return plate
    }()
    
    let taskCountBanner: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/6))
        view.backgroundColor = .white
        view.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    //let jobText = UITextView()
    let jobText = UILabel()
    
    let trashButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_trash"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/18,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/18)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let cleaningButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_housekeeper"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/16,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/16)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let movingButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_house"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/20,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/20)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let plantCareButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_plant"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/20,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/20)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let organizeButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_folder"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/20,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/20)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let shoppingButton1: UITaskButton = {
        let button = UITaskButton()
        let gradient = CAGradientLayer()
        
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/12
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.layer.borderWidth = UIScreen.main.bounds.height * 1/120
        button.setImage(#imageLiteral(resourceName: "ic_shoppingcart"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/20,left: UIScreen.main.bounds.height * 1/20,bottom: UIScreen.main.bounds.height * 1/20,right: UIScreen.main.bounds.height * 1/20)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_THEME
        button.setTitle("Confirm", for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        button.addTarget(self, action: #selector(toOrderScreen), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return button
    }()
    
    let noJobAlert: UIAlertController = {
        let alert = UIAlertController(title: "Select at least one job.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Choose jobs", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) }))
        return alert
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "back.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.tintColor = .white
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    let screenLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a job to get done"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //builds purple banner on top of screen
    fileprivate func buildBanner() {
        view.addSubview(purpleBanner)
        purpleBanner.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: 0)
        
        buildBackButton()
        buildScreenTitle()
    }
    
    fileprivate func buildBackButton() {
        view.addSubview(backButton)
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: UIScreen.main.bounds.height * 1/40, bottom: nil, bottomPad: 0, left: purpleBanner.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/36, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/36, width: UIScreen.main.bounds.width * 1/18)
    }
    
    fileprivate func buildScreenTitle() {
        view.addSubview(screenLabel)
        screenLabel.anchors(top: backButton.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/44, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 10, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 10, height: 0, width: 0)
    }
    
    fileprivate func buildBackground() {
        view.addSubview(backgroundPlate)
        backgroundPlate.anchors(top: purpleBanner.bottomAnchor, topPad: UIScreen.main.bounds.height * -1/40, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: 0, width: 0)
    }
    
    fileprivate func buildButtons() {
        buildTrashButton()
        buildCleaningButton()
        buildMovingButton()
        buildPlantCareButton()
        buildOrganizeButton()
        buildShoppingButton()
        buildBottomBanner()
    }
    
    fileprivate func buildTrashButton() {
        view.addSubview(trashButton1)
        trashButton1.anchors(top: backgroundPlate.topAnchor, topPad: UIScreen.main.bounds.height * 1/72
            , bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/10
            , right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildCleaningButton() {
        view.addSubview(cleaningButton1)
        cleaningButton1.anchors(top: backgroundPlate.topAnchor, topPad: UIScreen.main.bounds.height * 1/72
            , bottom: nil, bottomPad: 0, left: nil, leftPad: 0
            , right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/10, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildMovingButton() {
        view.addSubview(movingButton1)
        movingButton1.anchors(top: trashButton1.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/24
            , bottom: nil, bottomPad: 0, left: trashButton1.leftAnchor, leftPad: 0
            , right: trashButton1.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildPlantCareButton() {
        view.addSubview(plantCareButton1)
        plantCareButton1.anchors(top: cleaningButton1.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/24
            , bottom: nil, bottomPad: 0, left: cleaningButton1.leftAnchor, leftPad: 0
            , right: cleaningButton1.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildOrganizeButton() {
        view.addSubview(organizeButton1)
        organizeButton1.anchors(top: movingButton1.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/24
            , bottom: nil, bottomPad: 0, left: movingButton1.leftAnchor, leftPad: 0
            , right: movingButton1.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildShoppingButton() {
        view.addSubview(shoppingButton1)
        shoppingButton1.anchors(top: plantCareButton1.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/24
            , bottom: nil, bottomPad: 0, left: plantCareButton1.leftAnchor, leftPad: 0
            , right: plantCareButton1.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: UIScreen.main.bounds.height * 1/6)
    }
    
    fileprivate func buildBottomBanner() {
        view.addSubview(taskCountBanner)
        taskCountBanner.anchors(top: nil, topPad: 0, bottom: backgroundPlate.bottomAnchor, bottomPad: 0, left: backgroundPlate.leftAnchor, leftPad: 0, right: backgroundPlate.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/10, width: 0)
        
        /*
        view.addSubview(jobText)
        jobText.anchors(top: taskCountBanner.topAnchor, topPad: 0, bottom: taskCountBanner.bottomAnchor, bottomPad: 0, left: taskCountBanner.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: taskCountBanner.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/2, height: 0, width: 0)
        jobText.text = "\(activeTaskCount) jobs selected."
        jobText.textColor = .darkGray
        jobText.font = UIFont(name:"HelveticaNeue-Bold", size: 17)
        jobText.textAlignment = .center
         */
    }
    
    fileprivate func loadConfirmButton() {
        view.addSubview(confirmButton)
        confirmButton.anchors(top: taskCountBanner.topAnchor, topPad: UIScreen.main.bounds.height * 1/40, bottom: taskCountBanner.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/40, left: organizeButton1.leftAnchor, leftPad: 0, right: shoppingButton1.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/16, width: 0)
    }
    
    @objc func buttonTapped(sender: UITaskButton) {
        if errorStatus == false {
            if sender.backgroundColor == .white {
                sender.backgroundColor = ORANGE_THEME
                activeTaskCount += 1
                if activeTaskCount == 1 {
                    jobText.text = "\(activeTaskCount) job selected."
                } else {
                    jobText.text = "\(activeTaskCount) jobs selected."
                }
            } else if sender.backgroundColor == ORANGE_THEME {
                sender.backgroundColor = .white
                activeTaskCount -= 1
                if activeTaskCount == 1 {
                    jobText.text = "\(activeTaskCount) job selected."
                } else {
                    jobText.text = "\(activeTaskCount) jobs selected."
                }
            }
        }
    }
    
    @objc func createAlert() {
        self.present(noJobAlert, animated: true)
    }
    
    @objc func toOrderScreen(sender: UIButton) {
        if activeTaskCount > 0 {
            navigationController?.pushViewController(OrderScreen(),animated: false)
        } else if activeTaskCount == 0 {
            createAlert()
        }
    }
    
    @objc func backToHome() {
        navigationController?.pushViewController(PresentationNavigator(),animated: false)
    }
    
    //LABELS FOR BUTTONS
    let trashLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Trash Help"
        return label
    }()
    
    let cleanUpLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Party Cleanup"
        return label
    }()
    let movingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Moving Help"
        return label
    }()
    
    let plantLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Plant Care"
        return label
    }()
    
    let organizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Organization"
        return label
    }()
    
    let shoppingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
        label.text = "Shop for me"
        return label
    }()
    
    //function to place labels underneath buttons
    fileprivate func placeButtonLabels() {
        view.addSubview(trashLabel)
        view.addSubview(cleanUpLabel)
        view.addSubview(movingLabel)
        view.addSubview(plantLabel)
        view.addSubview(organizeLabel)
        view.addSubview(shoppingLabel)
        
        let jeff = UIScreen.main.bounds.width * 1/70
        
        trashLabel.anchors(top: trashButton1.bottomAnchor, topPad: jeff, bottom: movingButton1.topAnchor, bottomPad: jeff, left: trashButton1.leftAnchor, leftPad: jeff, right: trashButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
        
        cleanUpLabel.anchors(top: cleaningButton1.bottomAnchor, topPad: jeff, bottom: plantCareButton1.topAnchor, bottomPad: jeff, left: cleaningButton1.leftAnchor, leftPad: jeff, right: cleaningButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
        
        movingLabel.anchors(top: movingButton1.bottomAnchor, topPad: jeff, bottom: organizeButton1.topAnchor, bottomPad: jeff, left: movingButton1.leftAnchor, leftPad: jeff, right: movingButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
        
        plantLabel.anchors(top: plantCareButton1.bottomAnchor, topPad: jeff, bottom: shoppingButton1.topAnchor, bottomPad: jeff, left: plantCareButton1.leftAnchor, leftPad: jeff, right: plantCareButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
        
        organizeLabel.anchors(top: organizeButton1.bottomAnchor, topPad: jeff, bottom: nil, bottomPad: 0, left: organizeButton1.leftAnchor, leftPad: jeff, right: organizeButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
        
        shoppingLabel.anchors(top: shoppingButton1.bottomAnchor, topPad: jeff, bottom: nil, bottomPad: 0, left: shoppingButton1.leftAnchor, leftPad: jeff, right: shoppingButton1.rightAnchor, rightPad: jeff, height: 0, width: 0)
    }
    
    @objc func onClickButton(_ sender: UITaskButton) {
        deselectAllButtons(_sender: self)
        sender.isSelected = true
        sender.setTitleColor(.blue, for: .normal)
        sender.backgroundColor = ORANGE_THEME
        activeTaskCount = 1
    }
    func deselectAllButtons(_sender: Any){
        for subView in view.subviews
        {
            // Set all the other buttons as normal state
            if let button = subView as? UITaskButton {
                button.isSelected = false
                
                
                button.backgroundColor = .white
            }
        }
    }
}
