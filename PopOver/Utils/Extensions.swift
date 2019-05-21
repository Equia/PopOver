//
//  Extensions.swift
//  PopOver
//
//  Created by Chris Porter on 4/2/19.
//  Copyright © 2019 PopOver. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

extension UITextField {
    func setBottomBorder(backgroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backgroundColor.cgColor
        
        //defines the layer's shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.layer.shadowColor = borderColor.cgColor
    }
}

extension UIButton {
    func setButtonDesign(backgroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backgroundColor.cgColor
        
        //defines the layer's shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.layer.shadowColor = borderColor.cgColor
    }
}



//moves a UI field to a location on the screen
extension UIView {
    func anchors(top: NSLayoutYAxisAnchor?, topPad: CGFloat, bottom: NSLayoutYAxisAnchor?, bottomPad: CGFloat, left: NSLayoutXAxisAnchor?, leftPad: CGFloat, right: NSLayoutXAxisAnchor?, rightPad: CGFloat, height: CGFloat, width: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPad).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPad).isActive = true
        }
        
        if height > 0 { self.heightAnchor.constraint(equalToConstant: height).isActive = true}
        if width > 0 { self.widthAnchor.constraint(equalToConstant: width).isActive = true}
    }
}

extension UIView {
    func scalingAnchors(height: NSLayoutDimension?, heightScale: CGFloat, width: NSLayoutDimension?, widthScale: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            self.heightAnchor.constraint(equalTo: height, multiplier: heightScale).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalTo: width, multiplier: widthScale).isActive = true
        }
    }
}

extension UIViewController: MKMapViewDelegate {
    private func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let circelOverLay = overlay as? MKCircle else {return MKOverlayRenderer()}
        
        let circleRenderer = MKCircleRenderer(circle: circelOverLay)
        circleRenderer.strokeColor = .blue
        circleRenderer.fillColor = .blue
        circleRenderer.alpha = 0.2
        return circleRenderer
    }
}

extension UIView {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

class Alert: UIAlertController {
    var isPresented = false
    
    func dismissAlert(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismiss(animated: true, completion: nil)
        self.isPresented = false
        print("worked")
    }
    
    func pushNewViewController() {
        //self.dismiss(animated: false, completion: nil)
        self.navigationController?.pushViewController(GoOnlineController(), animated: true)
    }
}

extension UIViewController {
    @objc func pushJobInformationController() {
        navigationController?.pushViewController(GoOnlineController(), animated: true)
    }
}

class UITaskButton: UIButton {
    
}
