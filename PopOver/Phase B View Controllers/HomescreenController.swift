//
//  HomescreenController.swift
//  PopOver
//
//  Created by Chris Porter on 4/6/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class HomeScreenController: UIViewController, CLLocationManagerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME_MAIN
        navigationController?.isNavigationBarHidden = true
        placeItems()
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var userLocation = CLLocationManager()
    let mapView = MKMapView()

    fileprivate func loadMap() {
        
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = UIScreen.main.bounds.height
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        mapView.showsBuildings = true
        
        //let currentLocation = userLocation.location
        //let region = MKCoordinateRegion(center: currentLocation!.coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
        //mapView.setRegion(mapView.regionThatFits(region), animated: true)
        mapView.center = view.center
        view.addSubview(mapView)
        
        //let workCircle = MKCircle(center: currentLocation!.coordinate, radius: 500)
        //let circleOverlay = MKCircleRenderer(circle: workCircle)
        
        //circleOverlay.fillColor = THEME_HIGHLIGHTS
        //circleOverlay.strokeColor = THEME_MAIN
        //circleOverlay.alpha = 0.5
        
        print("ONE")
        //mapView.addOverlay(MKCircle(center: currentLocation!.coordinate, radius: 500))
        print("TWO")
    }
    /*
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: overlay)
            circleRenderer.fillColor = UIColor.blue
            return circleRenderer
        }
        return
    }
 */
    
    let setLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set location", for: .normal)
        button.backgroundColor = THEME_ACCENT_2
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        return button
    }()
    
    let openDrawerButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "user.png")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.tintColor = .darkGray
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 1/32
        button.layer.borderColor = THEME_MAIN_CGCOLOR
        button.layer.borderWidth = 5
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        button.layer.masksToBounds = false
        return button
    }()
    
    let drawer = NavigationDrawer()
    
    var menuShowing = false
    
    //creates invisible close menu button on right half of screen
    let closeMenuButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        return button
    }()
    
    fileprivate func loadSetLocationButton() {
        view.addSubview(setLocationButton)
        setLocationButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: UIScreen.main.bounds.height * 1/32, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/8, right: view.safeAreaLayoutGuide.rightAnchor, rightPad: UIScreen.main.bounds.width * 1/8, height: UIScreen.main.bounds.height * 1/16, width: 0)
    }
    
    fileprivate func loadOpenDrawerButton() {
        view.addSubview(openDrawerButton)
        openDrawerButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: UIScreen.main.bounds.width * 1/16, bottom: nil, bottomPad: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: UIScreen.main.bounds.width * 1/16, right: nil, rightPad: 0, height: UIScreen.main.bounds.height * 1/16, width: UIScreen.main.bounds.height * 1/16)
    }
    
    //helps with closing menu when appropriate side button is clicked
    fileprivate func closeMenuNoButton() {
        if menuShowing == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.drawer.center.x -= 0.66*UIScreen.main.bounds.width
                self.closeMenuButton.center.x += 0.33*UIScreen.main.bounds.width
            })
            UIButton.animate(withDuration: 0.5, animations: {
                //self.toWorkerCalendar.center.x -= 200
            })
            UITableView.animate(withDuration: 0.5, animations: {
                //self.menuTable.center.x -= 200
            })
        }
        menuShowing = !menuShowing
    }
    
    fileprivate func loadCloseMenuButton() {
        view.addSubview(closeMenuButton)
        closeMenuButton.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.bottomAnchor, bottomPad: 0, left: view.rightAnchor, leftPad: 0, right: nil, rightPad: 0, height:0, width: 0.33*UIScreen.main.bounds.width)
    }
    
    fileprivate func loadSideMenu() {
        view.addSubview(drawer)
        drawer.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 0, left: nil, leftPad: 0, right: view.leftAnchor, rightPad: 0, height: 0, width: 0.66*UIScreen.main.bounds.width)
    }
    
    fileprivate func placeItems() {
        loadMap()
        loadSetLocationButton()
        loadOpenDrawerButton()
        loadSideMenu()
        loadCloseMenuButton()
    }
    
    fileprivate func setUserLocation() {
        if CLLocationManager.locationServicesEnabled() {
            
            userLocation.delegate = self
            self.userLocation.requestWhenInUseAuthorization()
            self.userLocation.requestAlwaysAuthorization()
            self.userLocation.desiredAccuracy = kCLLocationAccuracyBest
            self.userLocation.startUpdatingLocation()
        }
    }
    
    //opens the side menu
    @objc func openMenu(_ sender: Any) {
        if menuShowing == false {
            UIView.animate(withDuration: 0.5, animations: { //animate open the sidemenu UIView
                self.drawer.center.x += 0.66*UIScreen.main.bounds.width
                self.closeMenuButton.center.x -= 0.33*UIScreen.main.bounds.width
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: { //animate close the sidemenu UIView
                self.drawer.center.x -= 0.66*UIScreen.main.bounds.width
            })
        }
        menuShowing = !menuShowing
    }
    
    //closes the side menu
    @objc func closeMenu(_ sender: Any) {
        if menuShowing == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.drawer.center.x -= 0.66*UIScreen.main.bounds.width
                self.closeMenuButton.center.x += 0.33*UIScreen.main.bounds.width
            })
        }
        menuShowing = !menuShowing
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
}
