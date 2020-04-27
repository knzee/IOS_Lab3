//
//  FailureVC.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

class FailureVC: UIViewController {
    private enum Const {
        static let text = " are missing. You can do it better!"
    }
    
    @IBOutlet weak var homeButton: RoundedButton!
    
    @IBOutlet weak var failureTextView: UITextView!
    
    var barTitle = "Failure"
    var failText = "data strings"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setUpNagigationBar()
        self.navigationController?.title = barTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        failureTextView.text = failText + Const.text
    }


    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
