//
//  PlankPresenter.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation

class PlankPresenter {
    private let repository: Repository
    weak private var plankViewDelegate: PlankViewDelegate?
    
    var timer: Timer?
    var plankTime = -1
    var timeLeft = -1
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func setViewDelegate(plankViewDelegate: PlankViewDelegate?) {
        self.plankViewDelegate = plankViewDelegate
        
        setUpPlank()
    }
    
    func setUpPlank() {
        plankTime = repository.getPlankTime()
        timeLeft = plankTime
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        plankViewDelegate?.redrawTimer(time: timeLeft)
        
        if timeLeft == 0 {
            timer!.invalidate()
            repository.submitPlankResults(time: plankTime, completed: true)
            
            plankViewDelegate?.openSuccessScreen()
            
        }
    }
    
    func finish() {
        timer?.invalidate()
        if (timeLeft > 0) {
            
            repository.submitPlankResults(time: plankTime - timeLeft, completed: false)
            
            plankViewDelegate?.openFailureScreen(message: "\(timeLeft) seconds")
        }
    }
}
