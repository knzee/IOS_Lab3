//
//  LocationService.swift
//  Lab3
//
//  Created by Test Testovich on 28/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import CoreLocation

protocol LocationServiceDelegate: class {
    func didUpdateLocation()
}

class LocationService: NSObject {
    
    weak var delegate: LocationServiceDelegate?
    private let locationManager = CLLocationManager()
    
    private var lastLocation: CLLocation!
    private var totalDistance: Double = 0
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    func getTraveledDistance() -> Int {
        return Int(totalDistance)
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last, lastLocation != nil {
            totalDistance += lastLocation.distance(from: location)
            self.delegate?.didUpdateLocation()
        }
        lastLocation = locations.last
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        manager.stopMonitoringSignificantLocationChanges()
        print(error)
    }
}
