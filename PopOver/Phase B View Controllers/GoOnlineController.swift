//
//  ActiveViewController3.swift
//  PopOver
//
//  Created by Chris Porter on 5/5/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

protocol sendActiveMessageDelegate {
    
    func setActiveMessage(activeMessage: String)
    
}

class GoOnlineController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        buildBanner()
        buildJobCard()
        buildTimeCard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var messageDelegate:sendActiveMessageDelegate?
    
    var activeTaskCount = 0
    
    var errorStatus = false
    
    let banner: UIView = {
        let banner = UIView()
        banner.backgroundColor = ORANGE_THEME
        banner.layer.shadowColor = UIColor.darkGray.cgColor
        banner.layer.shadowRadius = 2
        banner.layer.shadowOpacity = 0.7
        banner.layer.shadowOffset = CGSize(width: 1, height: 1)
        return banner
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
    
    let bannerTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Go Online"
        label.font = UIFont(name: "GillSans", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    @objc func backToHome() {
        navigationController?.popViewController(animated: true)
        //navigationController?.pushViewController(Dashboard(),animated: false)
    }
    
    fileprivate func buildBanner() {
        view.addSubview(banner)
        banner.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/16, width: 0)
        
        banner.addSubview(backButton)
        backButton.anchors(top: banner.topAnchor, topPad: 10, bottom: banner.bottomAnchor, bottomPad: 10, left: banner.leftAnchor, leftPad: 5, right: nil, rightPad: 0, height: 0, width: UIScreen.main.bounds.height * 1/24)
        
        banner.addSubview(bannerTitle)
        bannerTitle.anchors(top: backButton.topAnchor, topPad: 0, bottom: backButton.bottomAnchor, bottomPad: 0, left: banner.leftAnchor, leftPad: 30, right: banner.rightAnchor, rightPad: 30, height: 0, width: 0)
    }
    
    
    let jobCard: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowRadius = 4
        card.layer.shadowOpacity = 0.7
        card.layer.shadowOffset = CGSize(width: 2, height: 2)
        return card
    }()
    
    let chooseJobsLabel: UILabel = {
        let label = UILabel()
        label.text = "CHOOSE JOBS"
        label.font = UIFont(name:"GillSans-Bold", size: 10)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    let setActiveJobs: UILabel = {
        let label = UILabel()
        label.text = "Set Active Jobs"
        label.font = UIFont(name:"GillSans-Bold", size: 24)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Party Cleanup", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Trash Help", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Pet Care", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button4: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Plant Care", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button5: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Organization", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button6: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Lawn Care", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button7: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Moving Services", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button8: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Shopping", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let button9: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_ACCENT
        //button.layer.borderColor = ORANGE_THEME.cgColor
        //button.layer.borderWidth = 2
        button.setTitle("Delivery", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans", size: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(flipButton), for: .touchUpInside)
        return button
    }()
    
    let statusField: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(string: "Status Message", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.font = UIFont(name: "GillSans", size: 16)
        field.setBottomBorder(backgroundColor: .white, borderColor: .gray)
        return field
    }()
    
    @objc func flipButton(sender: UIButton) {
        if sender.backgroundColor == ORANGE_ACCENT {
            sender.backgroundColor = ORANGE_THEME
            sender.setTitleColor(.white, for: .normal)
            activeTaskCount += 1
        } else if sender.backgroundColor == ORANGE_THEME {
            sender.backgroundColor = ORANGE_ACCENT
            sender.setTitleColor(ORANGE_THEME, for: .normal)
            activeTaskCount -= 1
        }
    }
    
    @objc func passActiveJobs() {
        navigationController?.popViewController(animated: false)
    }
    
    fileprivate func buildJobCard() {
        view.addSubview(jobCard)
        jobCard.anchors(top: banner.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/32, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/2, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: 0, width: 0)
        
        jobCard.addSubview(chooseJobsLabel)
        chooseJobsLabel.anchors(top: jobCard.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: jobCard.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/20, width: 0)
        
        jobCard.addSubview(setActiveJobs)
        setActiveJobs.anchors(top: chooseJobsLabel.bottomAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: chooseJobsLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/30, width: 0)
        
        jobCard.addSubview(button1)
        button1.anchors(top: setActiveJobs.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: setActiveJobs.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/25, width: UIScreen.main.bounds.width * 1/3.5)
       
        jobCard.addSubview(button2)
        button2.anchors(top: button1.topAnchor, topPad: 0, bottom: button1.bottomAnchor, bottomPad: 0, left: button1.rightAnchor, leftPad: 10, right: nil, rightPad: 0, height: 0, width: UIScreen.main.bounds.width * 1/4.6)
        
        jobCard.addSubview(button3)
        button3.anchors(top: button1.topAnchor, topPad: 0, bottom: button1.bottomAnchor, bottomPad: 0, left: button2.rightAnchor, leftPad: 10, right: jobCard.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: 0, width: UIScreen.main.bounds.width * 1/4.5)
        
        jobCard.addSubview(button4)
        button4.anchors(top: button1.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: setActiveJobs.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/25, width: UIScreen.main.bounds.width * 1/5)
        
        jobCard.addSubview(button5)
        button5.anchors(top: button4.topAnchor, topPad: 0, bottom: button4.bottomAnchor, bottomPad: 0, left: button4.rightAnchor, leftPad: 10, right: nil, rightPad: 0, height: 0, width: UIScreen.main.bounds.width * 1/4)
        
        jobCard.addSubview(button6)
        button6.anchors(top: button4.topAnchor, topPad: 0, bottom: button4.bottomAnchor, bottomPad: 0, left: button5.rightAnchor, leftPad: 10, right: button3.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        jobCard.addSubview(button7)
        button7.anchors(top: button4.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: button4.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/25, width: UIScreen.main.bounds.width * 1/3.5)
        
        jobCard.addSubview(button8)
        button8.anchors(top: button7.topAnchor, topPad: 0, bottom: button7.bottomAnchor, bottomPad: 0, left: button7.rightAnchor, leftPad: 10, right: nil, rightPad: 0, height: 0, width: UIScreen.main.bounds.width * 1/5)
        
        jobCard.addSubview(button9)
        button9.anchors(top: button7.topAnchor, topPad: 0, bottom: button7.bottomAnchor, bottomPad: 0, left: button8.rightAnchor, leftPad: 10, right: button6.rightAnchor, rightPad: 0, height: 0, width: UIScreen.main.bounds.width * 1/5)
        
        jobCard.addSubview(statusField)
        statusField.anchors(top: button7.bottomAnchor, topPad: 30, bottom: jobCard.bottomAnchor, bottomPad: 10, left: button7.leftAnchor, leftPad: 0, right: button9.rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    let timeCard: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowRadius = 4
        card.layer.shadowOpacity = 0.7
        card.layer.shadowOffset = CGSize(width: 2, height: 2)
        return card
    }()
    
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Go online", for: .normal)
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/128
        button.layer.borderWidth = 2
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.addTarget(self, action: #selector(backToDash), for: .touchUpInside) //testing with this 
        return button
    }()
    
    let noJobAlert: UIAlertController = {
        let alert = UIAlertController(title: "Select at least one job.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Choose jobs", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) }))
        return alert
    }()
    
    let screenLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your jobs"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let slider: CustomSlider = {
        let slider = CustomSlider()
        slider.minimumValue = 1
        slider.maximumValue = 12
        slider.setValue(2, animated: false)
        slider.minimumTrackTintColor = ORANGE_THEME
        slider.thumbTintColor = ORANGE_THEME
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(changeSliderNumber), for: .valueChanged)
        return slider
    }()
    
    let timeCardHeader: UILabel = {
        let label = UILabel()
        label.text = "Set Your Schedule"
        label.font = UIFont(name:"GillSans-Bold", size: 24)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let timeCardSoftHeader: UILabel = {
        let label = UILabel()
        label.text = "SET AVAILABILITY"
        label.font = UIFont(name:"GillSans-Bold", size: 10)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    let freeLabel: UILabel = {
        let label = UILabel()
        label.text = "I'm free for the next..."
        label.font = UIFont(name:"GillSans", size: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    let sliderNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"GillSans-Bold", size: 24)
        label.text = "~30 mins"
        label.textAlignment = .center
        return label
    }()
    
    @objc func changeSliderNumber(sender: UISlider) {
        let sliderValue = Int(round(slider.value))
        slider.value = roundf(slider.value)
        sliderNumber.text = "~\(sliderValue * 15) mins"
    }
    
    fileprivate func buildTimeCard() {
        
        view.addSubview(timeCard)
        timeCard.anchors(top: jobCard.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/32, bottom: view.safeAreaLayoutGuide.bottomAnchor , bottomPad: UIScreen.main.bounds.height * 1/32, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: 0, width: 0)
        
        timeCard.addSubview(confirmButton)
        confirmButton.anchors(top: nil, topPad: 0, bottom: timeCard.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/25, left: timeCard.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: timeCard.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: UIScreen.main.bounds.height * 1/16, width: 0)
        
        timeCard.addSubview(slider)
        slider.anchors(top: nil, topPad: 0, bottom: confirmButton.topAnchor, bottomPad: 0, left: timeCard.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: timeCard.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: UIScreen.main.bounds.height * 1/16, width: 0)
        
        timeCard.addSubview(sliderNumber)
        sliderNumber.anchors(top: nil, topPad: 0, bottom: slider.topAnchor, bottomPad: 10, left: timeCard.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: timeCard.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: UIScreen.main.bounds.height * 1/16, width: 0)
        sliderNumber.centerXAnchor.constraint(equalTo: timeCard.centerXAnchor).isActive = true
        
        timeCard.addSubview(timeCardSoftHeader)
        timeCardSoftHeader.anchors(top: timeCard.topAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: timeCard.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: nil, rightPad: 0, height: 0, width: 0)
        
        timeCard.addSubview(timeCardHeader)
        timeCardHeader.anchors(top: timeCardSoftHeader.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: timeCardSoftHeader.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        
        timeCard.addSubview(freeLabel)
        freeLabel.anchors(top: nil, topPad: 0, bottom: sliderNumber.topAnchor, bottomPad: 0, left: nil, leftPad: 0, right: nil, rightPad:0, height: 0, width: 0)
        freeLabel.centerXAnchor.constraint(equalTo: timeCard.centerXAnchor).isActive = true
        
    }
    
    @objc func createAlert() {
        self.present(noJobAlert, animated: true)
    }
    
    @objc func backToDash(sender: UIButton) {
        let vc = Dashboard()
        //messageDelegate?.setActiveMessage(activeMessage: statusField.text!)
        //self.present(vc, animated: false)
        
        if activeTaskCount > 0 {
            messageDelegate?.setActiveMessage(activeMessage: statusField.text!)
            self.navigationController?.pushViewController(vc, animated: false)
            print(statusField.text!)
            print("works")
            //navigationController?.pushViewController(vc,animated: false)
        } else if activeTaskCount == 0 {
            print("doesn't work")
            createAlert()
        }
    }
    
}

class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 6.5))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
}
