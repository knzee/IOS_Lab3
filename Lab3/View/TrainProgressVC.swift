//
//  ViewController.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

protocol TrainProgressDelegate: NSObjectProtocol {
    func updateBody(weight: Int, height: Int)
}

class TrainProgressVC: UIViewController, TrainProgressDelegate {
    
    private enum Const {
        static let title = " "
    }
    
    @IBOutlet weak var plankUIView: RoundedUIView!
    @IBOutlet weak var runningUIView: RoundedUIView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!

    private let trainProgressPresenter = TrainProgressPresenter(repository: Repository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNagigationBar()
        self.title = Const.title
        
        setUpButtons()
        
        trainProgressPresenter.setViewDelegate(trainProgressViewDelegate: self)
    }
    
    @IBAction func openDetails(_ sender: Any) {
        let myBodyVC = MyBodyVC()
        myBodyVC.delegate = self
        self.navigationController?.pushViewController(myBodyVC, animated: true)
    }
    
    func setUpButtons() {
        let plankGesture = UITapGestureRecognizer(target: self, action: #selector(startPlank))
        plankUIView.addGestureRecognizer(plankGesture)
        
        let runningGesture = UITapGestureRecognizer(target: self, action: #selector(startRunning))
        runningUIView.addGestureRecognizer(runningGesture)
    }
    
    @objc func startPlank() {
        let plankVC = PlankVC()
        self.navigationController?.pushViewController(plankVC, animated: true)
    }
    
    @objc func startRunning() {
        let runningVC = RunningVC()
        self.navigationController?.pushViewController(runningVC, animated: true)
    }
    
    func updateBody(weight: Int, height: Int) {
        weightLabel.text = "\(weight) kg"
        heightLabel.text = "\(height) cm"
    }
}

