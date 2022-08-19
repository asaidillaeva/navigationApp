//
//  ViewController.swift
//  NavigationApp
//
//  Created by Aliia Saidillaeva  on 11/8/22.
//

import UIKit
import SnapKit
import GoogleMaps


class ViewController: UIViewController {
    
    private let mapView: GMSMapView = {
        let view = GMSMapView()

        return view
    }()
    
    let locationManager = CLLocationManager()
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
////        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
          locationManager.requestLocation()
          mapView.isMyLocationEnabled = true
          mapView.settings.myLocationButton = true
        } else {
          locationManager.requestWhenInUseAuthorization()
        }
        addMarker(title: "Dordoi plaza", comments: "Shop center", latitude: 42.8749913, longitude: 74.619477, icon: "shop")
        addMarker(title: "Beta Stores 2", comments: "Shop center", latitude: 42.8314114, longitude: 74.6226643, icon: "shop")
           
        addMarker(title: "AUCA", comments: "University", latitude: 42.8104206, longitude: 74.6272079, icon: "university")
        addMarker(title: "Neobis", comments: "Educational center", latitude: 42.871556107853344, longitude: 74.60871778652167, icon: "university")

    }
    
    func addMarker(title: String, comments: String, latitude: Double, longitude: Double, icon: String) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = title
        marker.snippet = comments
        marker.icon = UIImage(named: icon)
        marker.map = mapView
    }
    
    
    private func setup(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(mapView)
    }
    
    private func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate {

    func locationManager( _ manager: CLLocationManager,
                          didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
          return
        }

        locationManager.requestLocation()

        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
      }

      func locationManager(_ manager: CLLocationManager,
                           didUpdateLocations  locations: [CLLocation]) {
        guard let location = locations.first else {
          return
        }

        mapView.camera = GMSCameraPosition(
          target: location.coordinate,
          zoom: 15,
          bearing: 0,
          viewingAngle: 0)
      }

      func locationManager(_ manager: CLLocationManager,
                           didFailWithError error: Error) {
        print(error)
      }
    
}
