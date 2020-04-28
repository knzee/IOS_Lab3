//
//  UIExtensions.swift
//  Lab3
//
//  Created by Test Testovich on 26/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation
import UIKit

class RoundedUIView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
    
}

class CircleUIView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor(displayP3Red: 0.7, green: 0.38, blue: 0.95, alpha: 1.0).cgColor
        self.layer.borderWidth = 4.0
        self.clipsToBounds = true
    }
    
}

class RoundedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        self.layer.cornerRadius = 8.0
    }
}

class GradientUIView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [UIColor.clear.withAlphaComponent(0), UIColor(displayP3Red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)].map{$0.cgColor}
        gradientLayer.locations = [0.4,1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layer.addSublayer(gradientLayer)
    }
}

extension UIViewController {
    func setUpNagigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24.0)]
    }
}
