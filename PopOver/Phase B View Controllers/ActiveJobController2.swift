//
//  ActiveJobController2.swift
//  PopOver
//
//  Created by Chris Porter on 4/29/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit

class ActiveJobController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        buildBanner()
        loadTableData()
        buildConfirmButton()
        addSlider()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var activeTaskCount = 0
    
    var errorStatus = false
    
    let jobArray = ["Trash help","Pet Care","Plant Care","Organization","Lawn Care","Shopping","Cleaning", "Moving Help"]
    
    let menuTable: UITableView = {
        let table = UITableView()
        table.isScrollEnabled = false
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobArray.count
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
            
            let bgColorView = UIView()
            
            bgColorView.backgroundColor = THEME_HIGHLIGHTS
            
            cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            cell!.textLabel!.text = jobArray[indexPath.row] //populates the data
            cell?.backgroundColor = .white //background color of the cells
            cell?.textLabel?.textColor = .darkGray //text color of the cells
            cell?.textLabel?.highlightedTextColor = THEME_MAIN
            cell?.textLabel?.font = UIFont(name:"HelveticaNeue", size: 20)
            cell?.layer.cornerRadius = 5
            cell?.selectedBackgroundView = bgColorView
            //cell?.addSubview(paddingView)

            paddingView.contentMode = .bottom
        }
        return cell!
    }
    
    func loadTableData() {
        menuTable.dataSource = self
        menuTable.delegate = self
        menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        menuTable.rowHeight = UIScreen.main.bounds.height * 0.0825 //sets the height of the rows on the side menu
        menuTable.backgroundColor = .white
        menuTable.tableFooterView = UIView()
        menuTable.separatorStyle = .singleLine
        menuTable.separatorColor = .gray
        
        view.addSubview(menuTable)
        menuTable.anchors(top: purpleBanner.bottomAnchor, topPad: 10, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 1/4*UIScreen.main.bounds.height, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    //purple banner on top of screen
    let purpleBanner: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/8))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [PURPLE_GRADIENT1.cgColor, PURPLE_GRADIENT2.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(PURPLE_GRADIENT1, for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        button.layer.borderWidth = 3
        button.layer.borderColor = PURPLE_GRADIENT1.cgColor
        button.addTarget(self, action: #selector(toOrderScreen), for: .touchUpInside)
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
        label.text = "Select your jobs"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let slider: CustomSlider = {
        let slider = CustomSlider()
        slider.minimumValue = 1
        slider.maximumValue = 20
        slider.setValue(10, animated: false)
        slider.minimumTrackTintColor = UIColor(displayP3Red: 255 / 255, green: 96 / 255, blue: 22 / 255, alpha: 1)
        slider.thumbTintColor = UIColor(displayP3Red: 255 / 255, green: 96 / 255, blue: 22 / 255, alpha: 1)
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(changeSliderNumber), for: .valueChanged)
        return slider
    }()
    
    
    let sliderNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue", size: 16)
        return label
    }()
    
    @objc func changeSliderNumber(sender: UISlider) {
        let sliderValue = Int(round(slider.value))
        slider.value = roundf(slider.value)
        sliderNumber.text = "~\(sliderValue) mins"
    }
    
    //builds purple banner on top of screen
    fileprivate func buildBanner() {
        view.addSubview(purpleBanner)
        purpleBanner.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: UIScreen.main.bounds.height * 1/6, width: 0)
        
        buildBackButton()
        buildScreenTitle()
    }
    
    fileprivate func addSlider() {
        view.addSubview(slider)
        slider.anchors(top: menuTable.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/25, bottom: confirmButton.topAnchor, bottomPad: UIScreen.main.bounds.height * 1/25, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/16, height: 0, width: 0)
        
        view.addSubview(sliderNumber)
        sliderNumber.anchors(top: nil, topPad: 0, bottom: slider.topAnchor, bottomPad: 0, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        sliderNumber.centerXAnchor.constraint(equalTo: slider.centerXAnchor).isActive = true
    }
    
    fileprivate func buildBackButton() {
        view.addSubview(backButton)
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: UIScreen.main.bounds.height * 1/40, bottom: nil, bottomPad: 0, left: purpleBanner.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/36, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/36, width: UIScreen.main.bounds.width * 1/18)
    }
    
    fileprivate func buildScreenTitle() {
        view.addSubview(screenLabel)
        screenLabel.anchors(top: backButton.bottomAnchor, topPad: UIScreen.main.bounds.height * 1/44, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 10, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 10, height: 0, width: 0)
    }
    
    fileprivate func buildConfirmButton() {
        view.addSubview(confirmButton)
        confirmButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/25, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/8, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/8, height: UIScreen.main.bounds.height * 1/16, width: 0)
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
        navigationController?.pushViewController(HomeScreenController(),animated: false)
    }
}
