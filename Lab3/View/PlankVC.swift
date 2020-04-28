//
//  PlankVC.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

protocol PlankViewDelegate: NSObjectProtocol {
    func redrawTimer(time: Int)
    func openSuccessScreen()
    func openFailureScreen(message: String)
}

class PlankVC: UIViewController, PlankViewDelegate {
    
    private enum Const {
        static let title = "Plank"
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    private let plankPresenter = PlankPresenter(repository: Repository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setUpNagigationBar()
        self.navigationController?.title = Const.title
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        plankPresenter.setViewDelegate(plankViewDelegate: self)
    }
    
    func redrawTimer(time: Int) {
        timerLabel.text = "\(time)"
    }
    
    func openSuccessScreen() {
        let successVC = SuccessVC()
        successVC.barTitle = self.navigationController?.title ?? "Plank"
        self.navigationController?.pushViewController(successVC, animated: true)
    }
    
    func openFailureScreen(message: String) {
        let failureVC = FailureVC()
        failureVC.barTitle = self.navigationController?.title ?? "Plank"
        failureVC.failText = message
        self.navigationController?.pushViewController(failureVC, animated: true)
    }
    
    @IBAction func finish(_ sender: Any) {
        plankPresenter.finish()
    }
    
}
