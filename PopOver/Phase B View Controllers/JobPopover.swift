//
//  JobPopover.swift
//  PopOver
//
//  Created by Chris Porter on 5/14/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class JobController: UIViewController, CLLocationManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        placeLabel()
        placeMapPlate()
        makeMap()
        placeInformationLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let background: UIView = {
        let background = UIView()
        return background
    }()
    
    var _snapShotOptions: MKMapSnapshotter.Options = MKMapSnapshotter.Options()
    var _snapShot: MKMapSnapshotter!
    var center: CLLocationCoordinate2D!
    
    var mySpan: MKCoordinateSpan!
    var myRegion: MKCoordinateRegion!
    
    // Generate mapView
    func makeMap() {
        let mapView: MKMapView = {
            let mv = MKMapView(frame: self.view.frame)
            
                center = CLLocationCoordinate2DMake(47.2407171, -122.4395572)
            
                mv.centerCoordinate = center
            
                // Set the center point in MapView.
                mv.setCenter(center, animated: true)
            
                // Specify the scale (display area).
                mySpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                myRegion = MKCoordinateRegion(center: center, span: mySpan)
            
                // Added region to MapView.
                mv.region = myRegion
            
                mv.isPitchEnabled = false
                mv.isRotateEnabled = false
            
                return mv
            }()

        backCard.addSubview(mapView)
        mapView.anchors(top: backCard.topAnchor, topPad: 0, bottom: backCard.bottomAnchor, bottomPad: uiWidth * 3/8, left: backCard.leftAnchor, leftPad: 0, right: backCard.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        mapView.layer.cornerRadius = uiWidth * 1/32
        //_mapView.subviews[1].removeFromSuperview()
    
        
        // MKMapSnapShotOptions setting.
        _snapShotOptions.region = myRegion
        _snapShotOptions.size = mapView.frame.size
        _snapShotOptions.scale = UIScreen.main.scale
        
        // Set MKMapSnapShotOptions to MKMapSnapShotter.
        _snapShot = MKMapSnapshotter(options: _snapShotOptions)
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        
        snapShotter.start { (snapshot:MKMapSnapshotter.Snapshot?, error: Error?) in
            self.image = (snapshot?.image)!
        }
        
    }
    
    var image = UIImage()
    
    let uiHeight = UIScreen.main.bounds.height
    
    let uiWidth = UIScreen.main.bounds.width
    
    let backCard: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowRadius = 5
        card.layer.shadowOpacity = 0.7
        card.layer.shadowOffset = CGSize(width: 2, height: 2)
        return card
    }()
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Job Overview"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    let jobTitle: UILabel = {
        let label = UILabel()
        label.text = "Dog Walk"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let jobTitlelabel: UILabel = {
        let label = UILabel()
        label.text = "RAIN Incubator"
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = .gray
        return label
    }()
    
    let jobLocationlabel: UILabel = {
        let label = UILabel()
        label.text = "1900 Commerce St, Tacoma, WA"
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textColor = .gray
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let potentialJobArray = ["Golden retriever needs quick walk around block",
                             "My little terrier needs a quick walk",
                             "Can't make it from work today, need walk",
                             "Black lab needs quick walk",
                             "Spaniel needs to be let out"]
    
    let customerNote: UILabel = {
        let label = UILabel()
        label.text = "Customer Note"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    let jobDescription: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate func placeLabel() {
        view.addSubview(overviewLabel)
        overviewLabel.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: uiHeight * 1/32, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/20, width: 0)
    }
    
    fileprivate func placeMapPlate() {
        view.addSubview(backCard)
        backCard.anchors(top: overviewLabel.bottomAnchor, topPad: uiHeight * 1/32, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/32, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/32, height: uiWidth * 9/8, width: 0)
        
        backCard.addSubview(jobDescription)
        jobDescription.anchors(top: nil, topPad: 0, bottom: backCard.bottomAnchor, bottomPad: uiHeight * 1/100, left: backCard.leftAnchor, leftPad: uiWidth * 1/16, right: backCard.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/40, width: 0)
        
        backCard.addSubview(customerNote)
        customerNote.anchors(top: nil, topPad: 0, bottom: jobDescription.topAnchor, bottomPad: 0, left: backCard.leftAnchor, leftPad: uiWidth * 1/16, right: backCard.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/32, width: 0)
        
        backCard.addSubview(jobLocationlabel)
        jobLocationlabel.anchors(top: nil, topPad: 0, bottom: customerNote.topAnchor, bottomPad: 0, left: backCard.leftAnchor, leftPad: uiWidth * 1/16, right: backCard.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/32, width: 0)
        
        backCard.addSubview(jobTitlelabel)
        jobTitlelabel.anchors(top: nil, topPad: 0, bottom: jobLocationlabel.topAnchor, bottomPad: 0, left: backCard.leftAnchor, leftPad: uiWidth * 1/16, right: backCard.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/32, width: 0)
        
        backCard.addSubview(jobTitle)
        jobTitle.anchors(top: nil, topPad: 0, bottom: jobTitlelabel.topAnchor, bottomPad: 0, left: backCard.leftAnchor, leftPad: uiWidth * 1/16, right: backCard.rightAnchor, rightPad: uiWidth * 1/16, height: uiHeight * 1/32, width: 0)
        
        backCard.addSubview(lineView)
        lineView.anchors(top: jobLocationlabel.bottomAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: backCard.leftAnchor, leftPad: 0, right: backCard.rightAnchor, rightPad: 0, height: 1, width: 0)
        
        let randInt = Int.random(in: 0 ... 4)
        
        jobDescription.text = potentialJobArray[randInt]
        
    }
    
    
    let infoCard: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowRadius = 5
        card.layer.shadowOpacity = 0.7
        card.layer.shadowOffset = CGSize(width: 2, height: 2)
        return card
    }()
    
    let payLabel: UILabel = {
        let label = UILabel()
        label.text = "Job Earnings"
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    let payAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.font = UIFont(name: "HelveticaNeue", size: 24)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "Estimated Duration"
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let taskDurationLabel: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.font = UIFont(name: "HelveticaNeue", size: 24)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let acceptButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ORANGE_THEME
        button.layer.borderWidth = 2
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.setTitle("Accept", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
        button.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        button.setTitleColor(.white, for: .normal)
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(acceptJob), for: .touchUpInside)
        return button
    }()
    
    let declineButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = ORANGE_THEME.cgColor
        button.setTitle("Decline", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
        button.layer.cornerRadius = UIScreen.main.bounds.width * 1/32
        button.setTitleColor(ORANGE_THEME, for: .normal)
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        button.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        return button
    }()
    
    @objc func toHome() {
        navigationController?.pushViewController(Dashboard(), animated: false)
    }
    
    @objc func acceptJob() {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: "Job Accepted!", message: "Routing...", preferredStyle: .alert)
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Back to navigator", style: .default) { (action) -> Void in
            self.navigationController?.pushViewController(PresentationNavigator(), animated: false)
        }
        
        // Add Actions
        alertController.addAction(yesAction)
        
        // Present Alert Controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func placeInformationLabels() {
        view.addSubview(infoCard)
        infoCard.anchors(top: backCard.bottomAnchor, topPad: uiHeight * 1/32, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: uiHeight * 1/32, left: backCard.leftAnchor, leftPad: 0, right: backCard.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        infoCard.addSubview(acceptButton)
        acceptButton.anchors(top: nil, topPad: 0, bottom: infoCard.bottomAnchor, bottomPad: 0, left: infoCard.leftAnchor, leftPad: uiWidth * 15/32, right: infoCard.rightAnchor, rightPad: 0, height: uiHeight * 1/18, width: 0)
        
        infoCard.addSubview(declineButton)
        declineButton.anchors(top: nil, topPad: 0, bottom: infoCard.bottomAnchor, bottomPad: 0, left: infoCard.leftAnchor, leftPad: 0, right: infoCard.rightAnchor, rightPad: uiWidth * 15/32, height: uiHeight * 1/18, width: 0)
        
        
        infoCard.addSubview(payLabel)
        payLabel.anchors(top: infoCard.topAnchor, topPad: 0, bottom: acceptButton.topAnchor, bottomPad: uiHeight * 1/15, left: infoCard.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/2, height: 0, width: 0)
        
        infoCard.addSubview(payAmountLabel)
        payAmountLabel.anchors(top: payLabel.bottomAnchor, topPad: 0, bottom: acceptButton.topAnchor, bottomPad: uiHeight * 1/30, left: infoCard.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/2, height: 0, width: 0)
        
        infoCard.addSubview(durationLabel)
        durationLabel.anchors(top: infoCard.topAnchor, topPad: 0, bottom: acceptButton.topAnchor, bottomPad: uiHeight * 1/15, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/2, right: infoCard.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        infoCard.addSubview(taskDurationLabel)
        taskDurationLabel.anchors(top: durationLabel.bottomAnchor, topPad: 0, bottom: acceptButton.topAnchor, bottomPad: uiHeight * 1/30, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/2, right: infoCard.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        
        changePayAmount()
    }
    
    var timer = Timer()
    var duration = 0
    var durationMinutes = 0
    var durationHours = 0
    var leftOverTime = 0
    
    let timeOnlineCounter: UILabel = {
        let label = UILabel()
        label.text = "0:00" // edit to change time
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func changePayAmount() {
        let timeEstimate = Int.random(in: 0...4)
        var money = "0"
        var timeText = ""
        
        if timeEstimate == 0 {
            money = "$7.50"
            timeText = "15 mins"
        } else if timeEstimate == 1 {
            money = "$10.00"
            timeText = "30 mins"
        } else if timeEstimate == 2 {
            money = "$12.50"
            timeText = "45 mins"
        } else if timeEstimate == 3 {
            money = "$15.00"
            timeText = "1 hour"
        } else if timeEstimate == 4 {
            money = "$20.00"
            timeText = "90 mins"
        }
        
        payAmountLabel.text = money
        taskDurationLabel.text = timeText
        
        
    }
    
    func toggleTimer(on: Bool) { //this thing is nasty, sorry. WORKS LIKE A GODDAMN CHARM THOUGH!
        
        if on {
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
                
                guard let strongSelf = self else { return }
                
                strongSelf.duration += 1
                
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
}

