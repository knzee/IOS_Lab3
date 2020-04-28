//
//  MyBodyVC.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

protocol MyBodyDelegate: NSObjectProtocol {
    func setUpBody(weight: Int, height: Int, lastPlankTime: Int, plankProgress: Int, lastRunningDistance: Int, runningProgress: Int)
    func updateBodyParameters(weight: Int, height: Int)
}

class MyBodyVC: UIViewController, MyBodyDelegate {
    
    private enum Const {
        static let title = "Train progress"
        static let upImageName = "up"
        static let downImageName = "down"
        static let heightAlertLabel = "Change your height"
        static let weightAlertLabel = "Change your weight"
    }
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightEditButton: UIButton!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightEditButton: UIButton!
    
    @IBOutlet weak var lastPlankLabel: UILabel!
    @IBOutlet weak var plankProgressLabel: UILabel!
    @IBOutlet weak var plankProgressImage: UIImageView!
    
    @IBOutlet weak var lastRunningLable: UILabel!
    @IBOutlet weak var runningProgressLabel: UILabel!
    @IBOutlet weak var runningProgressImage: UIImageView!
    
    var delegate: TrainProgressDelegate?
    
    private let myBodyPresenter = MyBodyPresenter(repository: Repository())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpNagigationBar()
        self.title = Const.title
        
        myBodyPresenter.setViewDelegate(myBodyViewDelegate: self)
        
    }
    
    func setUpBody(weight: Int, height: Int, lastPlankTime: Int, plankProgress: Int, lastRunningDistance: Int, runningProgress: Int) {

        updateBodyParameters(weight: weight, height: height)
        
        lastPlankLabel.text = "\(lastPlankTime) seconds"
        
        plankProgressLabel.text = "\(plankProgress)%"
        
        if (plankProgress < 0) {
            plankProgressImage.image = UIImage(named: Const.downImageName)
        } else {
            plankProgressImage.image = UIImage(named: Const.upImageName)
        }

        lastRunningLable.text = "\(lastRunningDistance) meters"
        
        runningProgressLabel.text = "\(runningProgress)%"
        
        if (runningProgress < 0) {
            runningProgressImage.image = UIImage(named: Const.downImageName)
        } else {
            runningProgressImage.image = UIImage(named: Const.upImageName)
        }
        
    }
    
    func updateBodyParameters(weight: Int, height: Int) {
        weightLabel.text = "\(weight) kg"
        heightLabel.text = "\(height) cm"
        
        self.delegate?.updateBody(weight: weight, height: height)
    }

    @IBAction func editWeight(_ sender: Any) {
        let alert = UIAlertController(title: Const.weightAlertLabel, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: { action in
            let textField = alert.textFields![0]
            let newWeight = Int(textField.text ?? "") ?? 0

            self.myBodyPresenter.changeWeight(weight: newWeight)
        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func editHeight(_ sender: Any) {
        let alert = UIAlertController(title: Const.heightAlertLabel, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: { action in
            let textField = alert.textFields![0]
            let newHeight = Int(textField.text ?? "") ?? 0
            self.myBodyPresenter.changeHeight(height: newHeight)
        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
}
