//
//  Repository.swift
//  Lab3
//
//  Created by Test Testovich on 27/04/2020.
//  Copyright © 2020 TSU. All rights reserved.
//

import Foundation
import RealmSwift

class Repository {
    
    var realm: Realm
    
    let config = Realm.Configuration(
        schemaVersion: 3,
        migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 2) {
                /*let r = try! Realm()
                try! r.write {
                    r.deleteAll()
                }*/
            }
            
    })
    
    init() {
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
    }
    

    
    func getBody() -> Body {
        
        let bodyObj = realm.objects(Body.self)

        if (bodyObj.count == 0) {
            let running = Running()
            running.curDistance = 0
            running.lastDistance = 0
            
            let plank = Plank()
            plank.curTime = 20
            plank.lastTime = 20
            plank.max = 20
            
            let body = Body()
            body.height = 0
            body.weight = 0
            body.plank = plank
            body.running = running
            
            try! realm.write {
                realm.add(body)
            }
            
            return getBody()
            
        } else {
            return bodyObj[0]
        }
        
        
    }
    
    func getPlankTime() -> Int {
        let plank = getBody().plank
        
        print("c: \(plank!.curTime); l: \(plank!.lastTime); m: \(plank!.max)")
        
        if plank!.curTime == plank!.max {
            return plank!.max + 5
        }
        return plank!.max
        
    }
    
    func sumbitPlankResults(time: Int, completed: Bool) {
        let plank = realm.objects(Body.self).first!.plank
        
        if completed {
            try! realm.write {
                plank!.lastTime = plank!.curTime
                plank!.max = time + 5
                plank!.curTime = time
            }
        } else {
            try! realm.write {
                plank!.lastTime = plank!.curTime
                plank!.curTime = time
            }
        }
        
    }
    
    func changeWeight(weight: Int) {
        let bodyObj = realm.objects(Body.self)
        
        if (bodyObj.count != 0) {
            try! realm.write {
                bodyObj.first!.weight = weight
            }
        }
    }
    
    func changeHeight(height: Int) {
        let bodyObj = realm.objects(Body.self)
        
        if (bodyObj.count != 0) {
            try! realm.write {
                bodyObj.first!.height = height
            }
        }
    }
    
}
