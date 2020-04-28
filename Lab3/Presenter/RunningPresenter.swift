//
//  RunningPresenter.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation
import CoreLocation

class RunningPresenter: LocationServiceDelegate {
    
    private let repository: Repository
    weak private var runningViewDelegate: RunningViewDelegate?
    private let locationService = LocationService()
    
    private var maxDistance: Int = 0
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func setViewDelegate(runningViewDelegate: RunningViewDelegate?) {
        self.runningViewDelegate = runningViewDelegate
        
        self.locationService.delegate = self
        maxDistance = repository.getRunningDistance()

        self.locationService.startUpdatingLocation()
    }
    
    func didUpdateLocation() {
        let distance = locationService.getTraveledDistance()
        runningViewDelegate?.updateDistance(distance: maxDistance - distance)
        
        if distance >= maxDistance {
            locationService.stopUpdatingLocation()
            repository.submitRunningResults(distance: maxDistance, completed: true)
            runningViewDelegate?.openSuccessScreen()
        }
    }
    
    func finish() {
        let distance = locationService.getTraveledDistance()
        
        locationService.stopUpdatingLocation()
        
        if distance < maxDistance {
            repository.submitRunningResults(distance: distance, completed: false)
            runningViewDelegate?.openFailureScreen(message: "\(maxDistance - distance) meters")
        }
    }

}

