//
//  SuccessVC.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import UIKit

class SuccessVC: UIViewController {
    
    @IBOutlet weak var homeButton: RoundedButton!
    
    var barTitle = "Success"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setUpNagigationBar()
        self.navigationController?.title = barTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
