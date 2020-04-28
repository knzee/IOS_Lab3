//
//  TrainProgressPresenter.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation

class TrainProgressPresenter {
    private let repository: Repository
    weak private var trainProgressViewDelegate: TrainProgressDelegate?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func setViewDelegate(trainProgressViewDelegate: TrainProgressDelegate?) {
        self.trainProgressViewDelegate = trainProgressViewDelegate
        
        setUpBody()
    }
    
    func setUpBody() {
        let body = repository.getBody()
        
        trainProgressViewDelegate?.updateBody(weight: body.weight, height: body.height)
    }

}
