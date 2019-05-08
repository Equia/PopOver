//
//  OrderScreen.swift
//  PopOver
//
//  Created by Chris Porter on 4/25/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class OrderScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        buildBanner()
        buildBoxes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var orderText = "This displays the ordered task"
    
//screen label section
    let purpleBanner: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/8))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [BLUE_GRADIENT1.cgColor, BLUE_GRADIENT2.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }() //todo: place banner
   
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
        label.text = "Your order"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
//end of screen label section

//job information section
    let informationPlate: UIView = {
        let plate = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 9/10, height: UIScreen.main.bounds.height * 0.74))
        plate.backgroundColor = .white
        plate.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        plate.layer.shadowColor = UIColor.darkGray.cgColor
        plate.layer.shadowRadius = 5
        plate.layer.shadowOpacity = 0.7
        plate.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return plate
    }()
    
    let colorIndent: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 1/4, height: UIScreen.main.bounds.height * 1/5))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [PURPLE_GRADIENT1.cgColor, PURPLE_GRADIENT2.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.cornerRadius = UIScreen.main.bounds.width * 1/32
        gradient.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    let jobImage: UIImageView = {
        let jobImage = UIImageView()
        jobImage.image = UIImage(named: "finishedIcon.png")
        jobImage.contentMode = UIView.ContentMode.scaleAspectFit
        return jobImage
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        //label.text = orderText
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    let addressLabel1: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    let addressLabel2: UILabel = {
        let label = UILabel()
        label.text = "This displays the address to work at"
        label.font = UIFont(name:"HelveticaNeue", size: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
//end of information section
    
//job duration section
    let durationPlate: UIView = {
        let plate = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 9/10, height: UIScreen.main.bounds.height * 0.74))
        plate.backgroundColor = .white
        plate.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        plate.layer.shadowColor = UIColor.darkGray.cgColor
        plate.layer.shadowRadius = 5
        plate.layer.shadowOpacity = 0.7
        plate.layer.shadowOffset = CGSize(width: 2, height: 2)

        return plate
    }()
    
    var timeEstimate = "30"
    
    let timeText: UITextView = {
        let timeText = UITextView()
        //var timeEstimate = "30"
        timeText.text = "~30 min to complete"
        timeText.textAlignment = .center
        timeText.font = UIFont(name:"HelveticaNeue-Bold", size: 24)
        timeText.isEditable = false
        timeText.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        return timeText
    }()
    
    let min5Button: UIButton = {
        let button = UIButton()
        button.setTitle("5m", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let min15Button: UIButton = {
        let button = UIButton()
        button.setTitle("15m", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let min30Button: UIButton = {
        let button = UIButton()
        button.setTitle("30m", for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 135/255, green: 176/255, blue: 242/255, alpha: 1)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        button.isSelected = true
        return button
    }()
    
    let hr1Button: UIButton = {
        let button = UIButton()
        button.setTitle("1h", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let hr2Button: UIButton = {
        let button = UIButton()
        button.setTitle("2h", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    
//end of job duration section

//confirmation section
    let confirmationPlate: UIView = {
        let plate = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 9/10, height: UIScreen.main.bounds.height * 0.74))
        plate.backgroundColor = .white
        plate.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        plate.layer.shadowColor = UIColor.darkGray.cgColor
        plate.layer.shadowRadius = 5
        plate.layer.shadowOpacity = 0.7
        plate.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return plate
    }()
    
    let baseCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Task cost estimate"
        label.font = UIFont(name:"HelveticaNeue", size: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    let durationlabel: UILabel = {
        let label = UILabel()
        label.text = "Time estimate (hours)"
        label.font = UIFont(name:"HelveticaNeue", size: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    let taxLabel: UILabel = {
        let label = UILabel()
        label.text = "Tax"
        label.font = UIFont(name:"HelveticaNeue", size: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        label.textColor = UIColor(displayP3Red: 135/255, green: 176/255, blue: 242/255, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let taskCost: UITextView = {
        let labelText = UITextView()
        labelText.textColor = .gray
        labelText.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        labelText.text = "$10.00"
        labelText.textAlignment = .right
        labelText.isEditable = false
        labelText.translatesAutoresizingMaskIntoConstraints = true
        return labelText
    }()
    
    let durationConfirm: UITextView = {
        let labelText = UITextView()
        labelText.textColor = .gray
        labelText.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        labelText.text = "0.5"
        labelText.isEditable = false
        labelText.textAlignment = .right


        return labelText
    }()
    
    let taxCost: UITextView = {
        let labelText = UITextView()
        labelText.textColor = .gray
        labelText.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        labelText.text = "$1.01"
        labelText.isEditable = false
        labelText.textAlignment = .right
        return labelText
    }()
    
    let totalCost: UITextView = {
        let labelText = UITextView()
        labelText.textColor = UIColor(displayP3Red: 135/255, green: 176/255, blue: 242/255, alpha: 1)
        labelText.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        labelText.text = "$11.01"
        labelText.isEditable = false
        labelText.textAlignment = .right


        return labelText
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 7/10, height: UIScreen.main.bounds.height * 1/16))
        button.backgroundColor = PURPLE_GRADIENT2
        button.setTitle("Confirm", for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        
        let gradient = CAGradientLayer()
        
        gradient.frame = button.bounds
        gradient.colors = [PURPLE_GRADIENT1.cgColor, PURPLE_GRADIENT2.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.cornerRadius = UIScreen.main.bounds.height * 1/32
        
        button.layer.insertSublayer(gradient, at: 0)
        
        button.addTarget(self, action: #selector(createAlert), for: .touchUpInside)
        return button
    }()
    
//end of confirmation section
    
//building top banner functions
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
    
    @objc func backToHome() {
        navigationController?.popViewController(animated: true)
    }
//end of building top banner functions
    
    fileprivate func buildBoxes() {
        buildInformationBox()
        buildDurationBox()
        buildConfirmationBox()
    }
    
//job information building functions
    fileprivate func buildInformationBox() {
        view.addSubview(informationPlate)
        informationPlate.anchors(top: purpleBanner.bottomAnchor, topPad: UIScreen.main.bounds.height * -1/40, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: UIScreen.main.bounds.height * 1/5, width: 0)
        
        buildColorIndent()
        placeImage()
        buildJobTitle()
        buildAddressLabel1()
        buildAddressLabel2()
    }
    
    fileprivate func buildColorIndent() {
        informationPlate.addSubview(colorIndent)
        colorIndent.anchors(top: informationPlate.topAnchor, topPad: 0, bottom: informationPlate.bottomAnchor, bottomPad: 0, left: informationPlate.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: UIScreen.main.bounds.width * 1/4)
    }
    
    fileprivate func placeImage() {
        colorIndent.addSubview(jobImage)
        jobImage.anchors(top: colorIndent.topAnchor, topPad: 1, bottom: colorIndent.bottomAnchor, bottomPad: 1, left: colorIndent.leftAnchor, leftPad: 1, right: colorIndent.rightAnchor, rightPad: 1, height: 0, width: 0)
    }
    
    fileprivate func buildJobTitle() {
        informationPlate.addSubview(taskLabel)
        taskLabel.anchors(top: informationPlate.topAnchor, topPad: UIScreen.main.bounds.height * 1/50, bottom: nil, bottomPad: 0, left: colorIndent.rightAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: informationPlate.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: 0, width: 0)
        
        taskLabel.text = orderText
    }
    
    fileprivate func buildAddressLabel1() {
        informationPlate.addSubview(addressLabel1)
        addressLabel1.anchors(top: taskLabel.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/50, bottom: nil, bottomPad: 0, left: colorIndent.rightAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: informationPlate.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: 0, width: 0)
    }
    
    fileprivate func buildAddressLabel2() {
        informationPlate.addSubview(addressLabel2)
        addressLabel2.anchors(top: addressLabel1.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/100, bottom: nil, bottomPad: 0, left: colorIndent.rightAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: informationPlate.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: 0, width: 0)
    }
//end of job information building functions
    
//beginning of job duration building functions
    fileprivate func buildDurationBox() {
        view.addSubview(durationPlate)
        durationPlate.anchors(top: informationPlate.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/50, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: UIScreen.main.bounds.height * 1/6, width: 0)
        
        buildtimeLabel()
    }
    
    fileprivate func buildtimeLabel() {
        durationPlate.addSubview(timeText)
        timeText.anchors(top: durationPlate.topAnchor, topPad:0, bottom: nil, bottomPad: 0, left: durationPlate.leftAnchor, leftPad: 0, right: durationPlate.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/20, width: 0)
        
        buildTimeButtons()
    }
    
    fileprivate func buildTimeButtons() {
        
        let pad = UIScreen.main.bounds.height * 1/30
        let widthPad = UIScreen.main.bounds.width * 1/10
        durationPlate.addSubview(min5Button)
        min5Button.anchors(top: timeText.bottomAnchor, topPad: pad, bottom: durationPlate.bottomAnchor, bottomPad: pad, left: durationPlate.leftAnchor, leftPad: widthPad, right: nil, rightPad: 0, height: widthPad, width: widthPad)
        
        
        durationPlate.addSubview(min15Button)
        min15Button.anchors(top: timeText.bottomAnchor, topPad: pad, bottom: durationPlate.bottomAnchor, bottomPad: pad, left: durationPlate.leftAnchor, leftPad: widthPad * 2.5, right: nil, rightPad: 0, height: widthPad, width: widthPad)
        
        
        durationPlate.addSubview(min30Button)
        min30Button.anchors(top: timeText.bottomAnchor, topPad: pad, bottom: durationPlate.bottomAnchor, bottomPad: pad, left: durationPlate.leftAnchor, leftPad: widthPad * 4, right: nil, rightPad: 0, height: widthPad, width: widthPad)
        
        
        durationPlate.addSubview(hr1Button)
        hr1Button.anchors(top: timeText.bottomAnchor, topPad: pad, bottom: durationPlate.bottomAnchor, bottomPad: pad, left: durationPlate.leftAnchor, leftPad: widthPad * 5.5, right: nil, rightPad: 0, height: widthPad, width: widthPad)
        
        
        durationPlate.addSubview(hr2Button)
        hr2Button.anchors(top: timeText.bottomAnchor, topPad: pad, bottom: durationPlate.bottomAnchor, bottomPad: pad, left: durationPlate.leftAnchor, leftPad: widthPad * 7, right: nil, rightPad: 0, height: widthPad, width: widthPad)
    }
    
    
//end of job duration building functions
    
//beginning of confirmation building functions
    fileprivate func buildConfirmationBox() {
        view.addSubview(confirmationPlate)
        confirmationPlate.anchors(top: durationPlate.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/50, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/30, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/20, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/20, height: UIScreen.main.bounds.height * 1/5, width: 0)
        
        buildLabels()
        placePrices()
    }
    
    fileprivate func buildLabels() {
        
        let heightPad = UIScreen.main.bounds.height * 1/40
        let widthPad = UIScreen.main.bounds.width * 1/10
        
        confirmationPlate.addSubview(baseCostLabel)
        baseCostLabel.anchors(top: confirmationPlate.topAnchor, topPad: heightPad, bottom: nil, bottomPad: 0, left: confirmationPlate.leftAnchor, leftPad: widthPad, right: nil, rightPad: 0, height: 0, width: 0)
        
        confirmationPlate.addSubview(durationlabel)
        durationlabel.anchors(top: baseCostLabel.topAnchor, topPad: heightPad * 1.4, bottom: nil, bottomPad: 0, left: confirmationPlate.leftAnchor, leftPad: widthPad, right: nil, rightPad: 0, height: 0, width: 0)
        
        confirmationPlate.addSubview(taxLabel)
        taxLabel.anchors(top: durationlabel.topAnchor, topPad: heightPad * 1.4, bottom: nil, bottomPad: 0, left: confirmationPlate.leftAnchor, leftPad: widthPad, right: nil, rightPad: 0, height: 0, width: 0)
        
        confirmationPlate.addSubview(totalLabel)
        totalLabel.anchors(top: taxLabel.topAnchor, topPad: heightPad * 2, bottom: nil, bottomPad: 0, left: confirmationPlate.leftAnchor, leftPad: widthPad, right: nil, rightPad: 0, height: 0, width: 0)
        
    }
    
    fileprivate func placePrices() {
        
        let heightPad = UIScreen.main.bounds.height * 1/40
        let widthPad = UIScreen.main.bounds.width * 1/10
        confirmationPlate.addSubview(taskCost)
        taskCost.anchors(top: baseCostLabel.topAnchor, topPad: -1/2 * heightPad, bottom: nil, bottomPad: 0, left: baseCostLabel.rightAnchor, leftPad: 0, right: confirmationPlate.rightAnchor, rightPad: widthPad, height: heightPad * 2, width: 0)
        
        
        confirmationPlate.addSubview(durationConfirm)
        durationConfirm.anchors(top: durationlabel.topAnchor, topPad: -1/2 * heightPad, bottom: nil, bottomPad: 0, left: durationlabel.rightAnchor, leftPad: 0, right: confirmationPlate.rightAnchor, rightPad: widthPad, height: heightPad * 2, width: 0)
        
        
        
        confirmationPlate.addSubview(taxCost)
        taxCost.anchors(top: taxLabel.topAnchor, topPad: -1/2 * heightPad, bottom: nil, bottomPad: 0, left: taxLabel.rightAnchor, leftPad: 0, right: confirmationPlate.rightAnchor, rightPad: widthPad, height: heightPad * 2, width: 0)
        
        
        confirmationPlate.addSubview(totalCost)
        totalCost.anchors(top: totalLabel.topAnchor, topPad: -1/2 * heightPad, bottom: nil, bottomPad: 0, left: totalLabel.rightAnchor, leftPad: 0, right: confirmationPlate.rightAnchor, rightPad: widthPad, height: heightPad * 2, width: 0)
        
        confirmationPlate.addSubview(confirmButton)
        confirmButton.anchors(top: nil, topPad: 0, bottom: confirmationPlate.bottomAnchor, bottomPad: heightPad, left: confirmationPlate.leftAnchor, leftPad: widthPad, right: confirmationPlate.rightAnchor, rightPad: widthPad, height: UIScreen.main.bounds.height * 1/16, width: 0)
    }
    
    
    
//end of confirmation building functions
    
    @objc func onClickButton(_ sender: UIButton) {
        deselectAllButtons()
        sender.isSelected = true
        sender.setTitleColor(.blue, for: .normal)
        sender.backgroundColor = UIColor(displayP3Red: 135/255, green: 176/255, blue: 242/255, alpha: 1)
        
        if sender == min5Button {
            timeText.text = "~5 min to complete"
            taskCost.text = "$7.50"
            taxCost.text = "$0.76"
            totalCost.text = "$8.26"
            durationConfirm.text = "0.08"
        } else if sender == min15Button {
            timeText.text = "~15 min to complete"
            taskCost.text = "$7.50"
            taxCost.text = "$0.76"
            totalCost.text = "$8.26"
            durationConfirm.text = "0.25"
        } else if sender == min30Button {
            timeText.text = "~30 min to complete"
            taskCost.text = "$10.00"
            taxCost.text = "$1.01"
            totalCost.text = "$11.01"
            durationConfirm.text = "0.5"
        } else if sender == hr1Button {
            timeText.text = "~1 hour to complete"
            taskCost.text = "$15.00"
            taxCost.text = "$1.52"
            totalCost.text = "$16.52"
            durationConfirm.text = "1.0"
        } else if sender == hr2Button {
            timeText.text = "~2 hours to complete"
            taskCost.text = "$25.00"
            taxCost.text = "2.52"
            totalCost.text = "$27.52"
            durationConfirm.text = "2.0"
        }
    }
    
    func deselectAllButtons(){
        for subView in durationPlate.subviews
        {
            // Set all the other buttons as normal state
            if let button = subView as? UIButton {
                button.isSelected = false
                button.setTitleColor(.gray, for: .normal)
                button.backgroundColor = .white
                
            }
        }
    }
    
//confirmation alert
    let noJobAlert: UIAlertController = {
        let alert = UIAlertController(title: "Success! \n Order #5882 Received", message: "A PopOver worker is on \n their way to you as you read this. In the mean time, why not kick back and relax? We got this.", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Back to home", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) }))
        
        alert.addAction(UIAlertAction(title: "Back to home", style: UIAlertAction.Style.default, handler: { (action) in
            
            // go back to the login view controller
            // go back through the navigation controller
            
            let vc = HomeScreenController()
            alert.present(vc, animated: false, completion: nil)
            
            
        }))
        return alert
    }()
    
    @objc func createAlert() {
        self.present(noJobAlert, animated: true)
        
    }
}
