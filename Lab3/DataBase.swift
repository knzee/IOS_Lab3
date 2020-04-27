//
//  DataBase.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation
import RealmSwift

class Plank: Object {
    @objc dynamic var lastTime = 0
    @objc dynamic var curTime = 0
    @objc dynamic var max = 0
}

class Running: Object {
    @objc dynamic var lastDistance = 0
    @objc dynamic var curDistance = 0
}

class Body: Object {
    @objc dynamic var weight = 0
    @objc dynamic var height = 0
    @objc dynamic var plank: Plank?
    @objc dynamic var running: Running?
}

