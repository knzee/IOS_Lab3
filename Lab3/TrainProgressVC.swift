//
//  ViewController.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

protocol updateControl {
    func updateBody()
}

class TrainProgressVC: UIViewController, updateControl {
    
    private enum Const {
        static let title = " "
    }
    
    @IBOutlet weak var plankUIView: RoundedUIView!
    @IBOutlet weak var runningUIView: RoundedUIView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!

    let repository = Repository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNagigationBar()
        self.title = Const.title
        
        updateBody()
        
        setUpButtons()
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
        //plankVC.delegate = self
        self.navigationController?.pushViewController(plankVC, animated: true)
    }
    
    @objc func startRunning() {
        
    }
    
    func updateBody() {
        let body = repository.getBody()
        
        weightLabel.text = "\(body.weight) kg"
        heightLabel.text = "\(body.height) cm"
    }
}

