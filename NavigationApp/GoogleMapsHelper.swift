//
//  GoogleMapsHelper.swift
//  NavigationApp
//
//  Created by Aliia Saidillaeva  on 18/8/22.
//

import Foundation
import GoogleMaps

class GoogleMapsHelper {
    
    static func initLocationManager(_ manager: CLLocationManager, delegate: UIViewController) {
        
        var locationManager = manager
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = delegate as? CLLocationManagerDelegate
    }
    
    static func createMap(on view: UIView,
                          locationManager: CLLocationManager,
                          mapview: GMSMapView) {
        
    }
}
