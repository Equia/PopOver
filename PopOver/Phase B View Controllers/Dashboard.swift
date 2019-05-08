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

class Dashboard: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        buildDashHeader()
        placeHistoryCard()
        toggleTimer(on: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    let uiHeight = UIScreen.main.bounds.height
    
    let uiWidth = UIScreen.main.bounds.width
    
    
//map snapshot items
    


//end map snapshot items
    
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
    
    var earnings = 0.0
    
    
    
    
//build the orange header of the dashboard + components
    let dashBackground: UIView = {
        let background = UIView()
        background.backgroundColor = SOFT_ORANGE
        return background
    }()
    
    let dashTitle: UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.font = UIFont(name: "GillSans", size: 30)
        label.textColor = .white
        return label
    }()
    
    let earningsLabel: UILabel = {
        let label = UILabel()
        label.text = "Earnings"
        label.font = UIFont(name: "GillSans", size: 16)
        label.textColor = .white
        return label
    }()
    
    let earningsCounter: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.font = UIFont(name: "GillSans", size:24)
        label.textColor = .white
        return label
    }()
    
    let timeOnlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Time Online"
        label.font = UIFont(name: "GillSans", size: 16)
        label.textColor = .white
        return label
    }()
    
    let timeOnlineCounter: UILabel = {
        let label = UILabel()
        label.text = "0:00" // edit to change time
        label.font = UIFont(name: "GillSans", size: 24)
        label.textColor = .white
        return label
    }()
    
    let goOnlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Go Online"
        label.font = UIFont(name: "GillSans", size: 12)
        label.textColor = .white
        return label
    }()
    
    
    fileprivate func buildDashHeader() {
        view.addSubview(dashBackground)
        dashBackground.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 0, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: 0, height: uiHeight * 1/4, width: 0)
        
        dashBackground.addSubview(dashTitle)
        dashTitle.anchors(top: dashBackground.topAnchor, topPad: uiHeight*1/32, bottom: nil, bottomPad: 0, left: dashBackground.leftAnchor, leftPad: uiWidth*1/16, right: nil, rightPad: 0, height: 0, width: 0)
        
        dashBackground.addSubview(earningsLabel)
        earningsLabel.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: uiHeight * 1/12, left: dashBackground.leftAnchor, leftPad: uiWidth * 1/16, right: nil, rightPad: 0, height: 0, width: 0)
        
        dashBackground.addSubview(earningsCounter)
        earningsCounter.anchors(top: earningsLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: earningsLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        
        
        dashBackground.addSubview(timeOnlineLabel)
        timeOnlineLabel.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: uiHeight * 1/12, left: earningsLabel.rightAnchor, leftPad: uiWidth * 1/6, right: nil, rightPad: 0, height: 0, width: 0)
        
        
        dashBackground.addSubview(timeOnlineCounter)
        timeOnlineCounter.anchors(top: earningsLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: timeOnlineLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        
        dashBackground.addSubview(goOnlineLabel)
        goOnlineLabel.anchors(top: nil, topPad: 0, bottom: dashBackground.bottomAnchor, bottomPad: 3, left: nil, leftPad: 0, right: dashBackground.rightAnchor, rightPad: uiWidth * 1/15, height: 0, width: 0)
    }
//end of the dash header
    
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
    let historyEarningsArray = ["$9.39", "$11.27", "$7.51", "$15.03", "$7.51"]
    
    let historyArray = ["","","","",""]
    
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
            
            
            historyCellCard.addSubview(historyJobTitleLabel)
            historyJobTitleLabel.text = historyJobTitleArray[indexPath.row]
            historyJobTitleLabel.anchors(top: historyCellCard.topAnchor, topPad: (cell?.frame.size.height)! * 1/5, bottom: nil, bottomPad: 0, left: historyCellCard.leftAnchor, leftPad: historyCard.frame.size.height * 2/15, right: nil, rightPad: 0, height: 0, width: 0)
            
            historyCellCard.addSubview(historyDateStampLabel)
            historyDateStampLabel.text = "\(historyDateStampArray[indexPath.row]) \(historyTimeStampArray[indexPath.row])"
            historyDateStampLabel.anchors(top: historyJobTitleLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: historyJobTitleLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
            
            historyCellCard.addSubview(historyEarningsLabel)
            historyEarningsLabel.text = historyEarningsArray[indexPath.row]
            historyEarningsLabel.anchors(top: historyCellCard.topAnchor, topPad: 0, bottom: historyCellCard.bottomAnchor, bottomPad: 0, left: nil, leftPad: 0, right: historyCellCard.rightAnchor, rightPad: 10, height: 0, width: (cell?.frame.size.width)! * 1/5)
            
            
            //historyCellCard.addSubview(mapSnapshot)
            
            
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
        historyCard.anchors(top: dashBackground.bottomAnchor, topPad: uiHeight * 1/8, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: uiWidth * 1/16, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: uiWidth * 1/16, height: 0, width: 0)

        historyCard.addSubview(historyLabel)
        historyLabel.anchors(top: historyCard.topAnchor, topPad: 10, bottom: nil, bottomPad: 0, left: historyCard.leftAnchor, leftPad: uiWidth * 1/32, right: nil, rightPad: 0, height: 0, width: 0)
        
        historyCard.addSubview(recentJobslabel)
        recentJobslabel.anchors(top: historyLabel.bottomAnchor, topPad: 3, bottom: nil, bottomPad: 0, left: historyLabel.leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 0, width: 0)
        
        loadTableData()
        
    }
    
}
