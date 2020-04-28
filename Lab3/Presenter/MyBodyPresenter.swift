//
//  MyBodyPresenter.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation

class MyBodyPresenter {
    private let repository: Repository
    weak private var myBodyViewDelegate: MyBodyDelegate?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func setViewDelegate(myBodyViewDelegate: MyBodyDelegate?) {
        self.myBodyViewDelegate = myBodyViewDelegate
        
        setUpBody()
    }
    
    func setUpBody() {
        let body = repository.getBody()
        
        let weight = body.weight
        let height = body.height
        
        let lastPlankTime = body.plank!.curTime
        
        var temp: Double
        if body.plank!.lastTime != 0 {
            temp = Double(body.plank!.curTime)/Double(body.plank!.lastTime)
        } else {
            temp = 1
        }
        
        let plankProgress = Int(ceil(temp*100 - 100))
        
        let lastRunningDistance = body.running!.lastDistance
        
        if body.running!.lastDistance != 0 {
            temp = Double(body.running!.curDistance)/Double(body.running!.lastDistance)
        } else {
            temp = 1
        }
        
        let runningProgress = Int(ceil(temp*100 - 100))
        
        myBodyViewDelegate?.setUpBody(weight: weight, height: height, lastPlankTime: lastPlankTime, plankProgress: plankProgress, lastRunningDistance: lastRunningDistance, runningProgress: runningProgress)
        
    }
    
    func changeWeight(weight: Int) {
        repository.changeWeight(weight: weight)
        
        updateBodyParameters()
    }
    
    func changeHeight(height: Int) {
        repository.changeHeight(height: height)
        
        updateBodyParameters()
    }
    
    func updateBodyParameters() {
        let body = repository.getBody()
        
        let weight = body.weight
        let height = body.height
        
        myBodyViewDelegate?.updateBodyParameters(weight: weight, height: height)
    }
    
}
