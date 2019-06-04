//
//  Dashboard.swift
//  PopOver
//
//  Created by Chris Porter on 5/7/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import AudioToolbox

class Dashboard: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, sendActiveMessageDelegate, UIAlertViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backColor
        navigationController?.isNavigationBarHidden = true
        buildDashHeader()
        placeHistoryCard()
        toggleTimer(on: true)
        addEarnings()
        //placeStatusLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    let uiHeight = UIScreen.main.bounds.height
    
    let uiWidth = UIScreen.main.bounds.width
  
    var backColor = UIColor.white
    
    var alertPresented = false
    
//All the crap for the timer
    var timer = Timer()
    var duration = 0
    var durationMinutes = 0
    var durationHours = 0
    var leftOverTime = 0
    
    func toggleTimer(on: Bool) { //this thing is nasty, sorry. WORKS LIKE A GODDAMN CHARM THOUGH!
        
        if on {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in

            guard let strongSelf = self else { return }
            
            strongSelf.duration += 1
            
            if strongSelf.duration >= 10 { //change start of notifications
                strongSelf.showAlert()
            }
            
            if strongSelf.duration % 60 == 0 {
               
                strongSelf.durationMinutes += 1

                if strongSelf.durationMinutes < 10 {
                    
                    strongSelf.timeOnlineCounter.text = "0:0\(strongSelf.durationMinutes)" //duration less than 10 minutes

                } else if strongSelf.durationMinutes < 60 && strongSelf.durationMinutes >= 10 {
                    
                    strongSelf.timeOnlineCounter.text = "0:\(strongSelf.durationMinutes)" //duration between 10 and 60 minutes

                } else if strongSelf.durationMinutes % 60  == 0 {
                
                    strongSelf.timeOnlineCounter.text = "\(strongSelf.durationMinutes/60):00" //exactly on an hour mark
                
                } else if strongSelf.durationMinutes > 60 {
                    
                    strongSelf.durationHours = Int(floor(Double(strongSelf.durationMinutes/60)))
                    
                    strongSelf.leftOverTime = strongSelf.durationMinutes - (strongSelf.durationHours * 60)
                    
                    if strongSelf.leftOverTime < 10 {
                        
                        strongSelf.timeOnlineCounter.text = "\(strongSelf.durationHours):0\(strongSelf.leftOverTime)" //between 1 hour and 1 hour 10 minutes

                    } else if strongSelf.leftOverTime < 60 {
                        
                        strongSelf.timeOnlineCounter.text = "\(strongSelf.durationHours):\(strongSelf.leftOverTime)" //if over 1 hour and 10 minutes
                    }
                }
            }
            })
            
            } else {
            
            timer.invalidate()
    
        }
    }
//end all of the crap for the timer
    
//begin all of the crap for the earnings
    let historyEarningsArray = [9.39, 11.27, 7.51, 15.03, 7.51]
    
    var earningsNum = 0.0
    var earnings = ""

    func addEarnings() {
        earningsNum = historyEarningsArray.reduce(0, +)
        earnings = "$\(earningsNum)"
        earningsCounter.text = earnings
    }
    
//end all of the crap for the earnings
    
//build the orange header of the dashboard + components
    let dashBackground: UIView = {
        let background = UIView()
        background.backgroundColor = ORANGE_THEME
        return background
    }()
    
    let dashTitle: UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.font = UIFont(name: "GillSans", size: 30)
        label.textColor = .white
        return label
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
    
    @objc func backToHome() {
        alertPresented = true
        navigationController?.pushViewController(PresentationNavigator(), animated: false)
    }
    
    let earningsLabel: UILabel = {
        let label = UILabel()
        label.text = "Earnings"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let earningsCounter: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.font = UIFont(name: "GillSans", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let timeOnlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Time Online"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let timeOnlineCounter: UILabel = {
        let label = UILabel()
        label.text = "0:00" // edit to change time
        label.font = UIFont(name: "GillSans", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let goOnlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Go Online"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let onlineButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "power.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.tintColor = .white
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = UIScreen.main.bounds.width * 1/16
        button.imageEdgeInsets = UIEdgeInsets(top: UIScreen.main.bounds.height * 1/24,left: UIScreen.main.bounds.height * 1/24,bottom: UIScreen.main.bounds.height * 1/24,right: UIScreen.main.bounds.height * 1/24)
        button.addTarget(self, action: #selector(pickJobs), for: .touchUpInside)
        return button
    }()
    
    @objc func pickJobs() {
        alertPresented = true
        let vc = GoOnlineController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    
    fileprivate func buildDashHeader() {
        view.addSubview(dashBackground)
        dashBackground.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: uiHeight * 1/4, width: 0)
        
        dashBackground.addSubview(backButton)
        backButton.anchors(top: dashBackground.topAnchor, topPad: uiHeight * 1/32, bottom: nil, bottomPad: 0, left: dashBackground.leftAnchor, leftPad: 5, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/24, width: UIScreen.main.bounds.height * 1/24)
        
        dashBackground.addSubview(dashTitle)
        dashTitle.anchors(top: dashBackground.topAnchor, topPad: uiHeight*1/32, bottom: nil, bottomPad: 0, left: backButton.rightAnchor, leftPad: uiWidth * 1/16, right: nil, rightPad: 0, height: 0, width: 0)
        
        dashBackground.addSubview(earningsLabel)
        earningsLabel.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: uiHeight * 1/12, left: dashBackground.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: uiWidth * 1/3)
        
        dashBackground.addSubview(earningsCounter)
        earningsCounter.anchors(top: earningsLabel.bottomAnchor, topPad: 15, bottom: nil, bottomPad: 0, left: earningsLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        earningsCounter.centerXAnchor.constraint(equalTo: earningsLabel.centerXAnchor).isActive = true
        
        
        dashBackground.addSubview(timeOnlineLabel)
        timeOnlineLabel.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: uiHeight * 1/12, left: earningsLabel.rightAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: uiWidth * 1/3)
        
        dashBackground.addSubview(timeOnlineCounter)
        timeOnlineCounter.anchors(top: earningsLabel.bottomAnchor, topPad: 15, bottom: nil, bottomPad: 0, left: timeOnlineLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        timeOnlineCounter.centerXAnchor.constraint(equalTo: timeOnlineLabel.centerXAnchor).isActive = true
        
        dashBackground.addSubview(goOnlineLabel)
        goOnlineLabel.anchors(top: timeOnlineLabel.topAnchor, topPad: 0, bottom: nil, bottomPad: 3, left: timeOnlineLabel.rightAnchor, leftPad: 0, right: dashBackground.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        dashBackground.addSubview(onlineButton)
        onlineButton.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: 7, left: timeOnlineLabel.rightAnchor, leftPad: uiWidth * 1/6, right: dashBackground.rightAnchor, rightPad: uiWidth * 1/16, height: uiWidth * 1/8, width: uiWidth * 1/8)
        onlineButton.centerXAnchor.constraint(equalTo: goOnlineLabel.centerXAnchor).isActive = true
    }
//end of the dash header
    
//beginning of stuff for status message
    
    let statusMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Status Message"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .gray
        return label
    }()
    
    
    let statusMessage: UITextField = {
        let field = UITextField()
        field.text = "Placeholder"
        field.textColor = .gray
        return field
    }()
    
    func changeLabel(labelText: String) {
        statusMessage.text = labelText
    }
    
    
//end of stuff for status message
    
    
    
    
    let historyCard: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowRadius = 5
        card.layer.shadowOpacity = 0.7
        card.layer.shadowOffset = CGSize(width: 2, height: 2)
        return card
    }()
    
    let historyLabel: UILabel = {
        let label = UILabel()
        label.text = "HISTORY"
        label.font = UIFont(name: "GillSans", size: 12)
        label.textColor = .gray
        return label
    }()
    
    let recentJobslabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Jobs"
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        label.textColor = .black
        return label
    }()
    
    let historyTable: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.isScrollEnabled = false
        return table
    }()
    
    let historyJobTitleArray = ["Lawn Care", "Dog Walk", "House Cleaning", "Dog Walk", "Party Cleanup"]
    let historyDateStampArray = ["March 3rd, 2019", "March 13th, 2019", "March 13th, 2019", "April 8th, 2019", "April 14th, 2019"]
    let historyTimeStampArray = ["3:14 PM", "11:00 AM", "12:30 PM", "12:55 PM", "4:35 PM"]
    
    let historyArray = ["","","","",""]
    
    let latitudeArray = [37.3327,87.2077,55.3377,27.3320,34.3347]
    let longitudeArray = [-122.2962,122.5362,-42.8962,-3.1302,-16.0093]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if cell?.isHighlighted == true {
            cell?.backgroundColor = THEME_ACCENT
        }
        
        //builds the menu table on the side menu, populates with options for other pages to go to
        //adds images to left of each button
        if tableView == self.historyTable {
            
            let bgColorView = UIView()
            
            let historyCellCard: UIView = {
                let historyView = UIView()
                historyView.backgroundColor = .white
                return historyView
            }()
            
            let historyJobTitleLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
                label.textColor = .darkGray
                return label
            }()
            
            let historyDateStampLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "HelveticaNeue", size: 12)
                label.textColor = .gray
                return label
            }()

            
            let historyEarningsLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "HelveticaNeue", size: 18)
                label.textColor = MONEY_GREEN
                label.textAlignment = .center
                return label
            }()
            
            //################################# YOU ARE NOW ENTERING THE DANGER ZONE #################################
            //map snapshot items
            //I HAVE ABSOLUTELY NO FUCKING CLUE WHAT THIS DOES BUT SOMEHOW IT WORKS -- CHRIS
            var _snapShotOptions: MKMapSnapshotter.Options = MKMapSnapshotter.Options()
            var _snapShot: MKMapSnapshotter!
            var center: CLLocationCoordinate2D!
            
            var mySpan: MKCoordinateSpan!
            var myRegion: MKCoordinateRegion!
            
            // Generate mapView
            var _mapView: MKMapView = {
                let mv = MKMapView(frame: self.view.frame)
                
                center = CLLocationCoordinate2DMake(latitudeArray[indexPath.row], longitudeArray[indexPath.row])
                
                mv.centerCoordinate = center
                
                // Set the center point in MapView.
                mv.setCenter(center, animated: true)
                
                // Specify the scale (display area).
                mySpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                myRegion = MKCoordinateRegion(center: center, span: mySpan)
                
                // Added region to MapView.
                mv.region = myRegion
                
                return mv
            }()
            
            func loadMapStuff(host: UITableViewCell) { //loads map into the cell -- incredibly important
                
                // Do any additional setup after loading the view.
                
                // Add mapView on view
                host.addSubview(_mapView)
                _mapView.anchors(top: host.topAnchor, topPad: 0, bottom: host.bottomAnchor, bottomPad: 0, left: host.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: historyCard.frame.size.height * 2/15, width: historyCard.frame.size.height * 2/15)
                _mapView.subviews[1].removeFromSuperview()
                
                // Add button on view
                //self.view.addSubview(_button)
                
                // MKMapSnapShotOptions setting.
                _snapShotOptions.region = myRegion
                _snapShotOptions.size = _mapView.frame.size
                _snapShotOptions.scale = UIScreen.main.scale
                
                // Set MKMapSnapShotOptions to MKMapSnapShotter.
                _snapShot = MKMapSnapshotter(options: _snapShotOptions)
            }
            
            //end map snapshot items
            //################################# YOU ARE NOW LEAVING THE DANGER ZONE #################################
            
            
            bgColorView.backgroundColor = ORANGE_ACCENT
            
            cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            //cell!.textLabel!.text = historyArray[indexPath.row] //populates the data
            cell?.backgroundColor = .white //background color of the cells
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.textLabel?.textColor = .darkGray //text color of the cells
            cell?.textLabel?.highlightedTextColor = THEME_MAIN
            cell?.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
            cell?.layer.cornerRadius = 0
            cell?.selectedBackgroundView = bgColorView
            cell?.layoutMargins.left = historyCard.frame.size.height * 2/15
            cell?.layoutMargins.right = UIScreen.main.bounds.width * 0.1
            
            //builds the history uiview
            cell?.addSubview(historyCellCard)
            historyCellCard.layer.masksToBounds = true
            historyCellCard.anchors(top: cell?.topAnchor, topPad: 0, bottom: cell?.bottomAnchor, bottomPad: 0, left: cell?.leftAnchor, leftPad: 0, right: cell?.rightAnchor, rightPad: 0, height: 0, width: 0)
            
            loadMapStuff(host: cell!)
            
            historyCellCard.addSubview(historyJobTitleLabel)
            historyJobTitleLabel.text = historyJobTitleArray[indexPath.row]
            historyJobTitleLabel.anchors(top: historyCellCard.topAnchor, topPad: (cell?.frame.size.height)! * 1/5, bottom: nil, bottomPad: 0, left: _mapView.rightAnchor, leftPad: 10, right: nil, rightPad: 0, height: 0, width: 0)
            
            historyCellCard.addSubview(historyDateStampLabel)
            historyDateStampLabel.text = "\(historyDateStampArray[indexPath.row]) \(historyTimeStampArray[indexPath.row])"
            historyDateStampLabel.anchors(top: historyJobTitleLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: historyJobTitleLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
            
            historyCellCard.addSubview(historyEarningsLabel)
            historyEarningsLabel.text = "$\(historyEarningsArray[indexPath.row])"
            historyEarningsLabel.anchors(top: historyCellCard.topAnchor, topPad: 0, bottom: historyCellCard.bottomAnchor, bottomPad: 0, left: nil, leftPad: 0, right: historyCellCard.rightAnchor, rightPad: 10, height: 0, width: (cell?.frame.size.width)! * 1/5)
            
            
            //end of building history uiview
        
        
        }
        return cell!
    }
    
    func loadTableData() {
        historyTable.dataSource = self
        historyTable.delegate = self
        historyTable.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        historyTable.rowHeight = UIScreen.main.bounds.height * 0.0825 //sets the height of the rows on the side menu
        historyTable.backgroundColor = .white
        historyTable.tableFooterView = UIView()
        historyTable.separatorStyle = .none
        
        historyCard.addSubview(historyTable)
        historyTable.anchors(top: recentJobslabel.bottomAnchor, topPad: 10, bottom: historyCard.bottomAnchor, bottomPad: 10, left: historyCard.leftAnchor, leftPad: uiWidth * 1/32, right: historyCard.rightAnchor, rightPad: uiWidth * 1/32, height: historyCard.frame.size.height * 2/3, width: 0)
    }
    
    fileprivate func placeHistoryCard() {
        view.addSubview(historyCard)
        historyCard.anchors(top: dashBackground.bottomAnchor, topPad: uiHeight * 1/20, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/10, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/16, height: 0, width: 0)

        historyCard.addSubview(historyLabel)
        historyLabel.anchors(top: historyCard.topAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: historyCard.leftAnchor, leftPad: uiWidth * 1/32, right: nil, rightPad: 0, height: 0, width: 0)
        
        historyCard.addSubview(recentJobslabel)
        recentJobslabel.anchors(top: historyLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: historyLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        
        loadTableData()
        
    }
    
    fileprivate func placeStatusLabel () {
        view.addSubview(statusMessageLabel)
        statusMessageLabel.anchors(top: dashBackground.bottomAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 10, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 10, height: uiHeight * 1/16, width: 0)
    }
    
    func setActiveMessage(activeMessage: String) {
        statusMessageLabel.text = activeMessage
        print("went off")
    }
    
    
//create job notification alert
    
    
    fileprivate func showAlert() {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: "Dog Walking", message: "1900 Commerce St, Tacoma, WA", preferredStyle: .alert)
        
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Accept", style: .default) { (action) -> Void in
            self.navigationController?.pushViewController(JobController(), animated: true)
        }
        
        let noAction = UIAlertAction(title: "Back", style: .default) { (action) -> Void in
            self.alertPresented = false
        }
        
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        // Present Alert Controller
        
        let randInt = Int.random(in: 0 ... 5)
        
        if randInt == 5 && alertPresented == false {
            alertPresented = true
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

        self.present(alertController, animated: true, completion: nil)
        }
    }

    
//end of job notification alert
    
}
