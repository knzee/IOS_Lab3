//
//  RunningVC.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

protocol RunningViewDelegate: NSObjectProtocol {
    func updateDistance(distance: Int)
    func openSuccessScreen()
    func openFailureScreen(message: String)
}

class RunningVC: UIViewController, RunningViewDelegate {
    
    private enum Const {
        static let title = "Running"
    }
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var finishButton: RoundedButton!
    
    
    private let runningPresenter = RunningPresenter(repository: Repository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setUpNagigationBar()
        self.navigationController?.title = Const.title
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        runningPresenter.setViewDelegate(runningViewDelegate: self)
        
    }
    
    func updateDistance(distance: Int) {
        distanceLabel.text = "\(distance)"
    }
    
    func openSuccessScreen() {
        let successVC = SuccessVC()
        successVC.barTitle = self.navigationController?.title ?? "Running"
        self.navigationController?.pushViewController(successVC, animated: true)
    }
    
    func openFailureScreen(message: String) {
        let failureVC = FailureVC()
        failureVC.barTitle = self.navigationController?.title ?? "Running"
        failureVC.failText = message
        self.navigationController?.pushViewController(failureVC, animated: true)
    }
    
    
    
    @IBAction func finish(_ sender: Any) {
        runningPresenter.finish()
    }
    
}


