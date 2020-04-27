//
//  MyBodyVC.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

class MyBodyVC: UIViewController {
    
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
    
    var delegate: updateControl?
    
    let repository = Repository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpNagigationBar()
        self.title = Const.title
        
        setUpBody()
        
        
    }
    
    func setUpBody() {
        let body = repository.getBody()
        
        weightLabel.text = "\(body.weight) kg"
        heightLabel.text = "\(body.height) cm"
        
        lastPlankLabel.text = "\(body.plank!.curTime) seconds"
        
        var temp: Double
        print("curTime: \(body.plank!.curTime); lastTime: \(body.plank!.lastTime)")
        if body.plank!.lastTime != 0 {
            temp = Double(body.plank!.curTime)/Double(body.plank!.lastTime)
        } else {
            temp = 1
        }
        var progress = Int(ceil(abs(100 - temp*100)))
        
        plankProgressLabel.text = "\(progress)%"
        
        if (temp < 1) {
            plankProgressImage.image = UIImage(named: Const.downImageName)
        } else {
            plankProgressImage.image = UIImage(named: Const.upImageName)
        }
        
        if body.running!.lastDistance != 0 {
            temp = Double(body.running!.curDistance)/Double(body.running!.lastDistance)
        } else {
            temp = 1
        }
        
        progress = Int(ceil(abs(100 - temp*100)))
        
        runningProgressLabel.text = "\(progress)%"
        
        if (temp < 1) {
            runningProgressImage.image = UIImage(named: Const.downImageName)
        } else {
            runningProgressImage.image = UIImage(named: Const.upImageName)
        }
        
        
    }
    
    func updateBody() {
        self.delegate?.updateBody()
        
        let body = repository.getBody()
        
        weightLabel.text = "\(body.weight) kg"
        heightLabel.text = "\(body.height) cm"
    }


    @IBAction func editWeight(_ sender: Any) {
        let alert = UIAlertController(title: Const.weightAlertLabel, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: { action in
            let textField = alert.textFields![0]
            let newWeight = Int(textField.text ?? "") ?? 0
            self.repository.changeWeight(weight: newWeight)
            self.updateBody()
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
            self.repository.changeHeight(height: newHeight)
            self.updateBody()
        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    
    
    
    
}
