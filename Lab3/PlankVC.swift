//
//  PlankVC.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

class PlankVC: UIViewController {
    
    private enum Const {
        static let title = "Plank"
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    let repository = Repository()
    var timer: Timer?
    var plankTime = -1
    var timeLeft = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setUpNagigationBar()
        self.navigationController?.title = Const.title
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setUpPlank()
    }
    
    func setUpPlank() {
        plankTime = repository.getPlankTime()
        timeLeft = plankTime
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft)"
        
        if timeLeft == 0 {
            timer!.invalidate()
            repository.sumbitPlankResults(time: plankTime, completed: true)
            
            let successVC = SuccessVC()
            successVC.barTitle = self.navigationController?.title ?? "Plank"
            self.navigationController?.pushViewController(successVC, animated: true)
            
        }
    }
    
    @IBAction func finish(_ sender: Any) {
        timer?.invalidate()
        if (timeLeft > 0) {
            
            repository.sumbitPlankResults(time: plankTime - timeLeft, completed: false)
            
            let failureVC = FailureVC()
            failureVC.barTitle = self.navigationController?.title ?? "Plank"
            failureVC.failText = "\(timeLeft) seconds"
            self.navigationController?.pushViewController(failureVC, animated: true)
        }

    }
    
}
